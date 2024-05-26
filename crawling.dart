import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

void main() async {
  print('start');
  final String domain = 'backup.manaka-net.com';
  final Uri startUri = Uri.parse('https://$domain');

  final Set<Uri> visitedUrls = HashSet<Uri>();
  final List<Uri> urlsToVisit = [startUri];

  while (urlsToVisit.isNotEmpty) {
    final Uri currentUri = urlsToVisit.removeLast();

    if (visitedUrls.contains(currentUri)) {
      continue;
    }

    print('Visiting: $currentUri');

    final http.Response response;
    try {
      response = await http.get(currentUri);
    } catch (e) {
      // print('Failed to load $currentUri: $e');
      continue;
    }

    if (response.statusCode != 200) {
      print('Failed to load $currentUri: ${response.statusCode}');
      visitedUrls.add(currentUri);
      continue;
    }

    visitedUrls.add(currentUri);

    final Document document = parse(utf8.decode(response.bodyBytes, allowMalformed: true));
    final List<Element> anchorTags = document.querySelectorAll('a[href]');

    for (final Element anchor in anchorTags) {
      final href = anchor.attributes['href'];
      if (href == null) {
        continue;
      }

      final uri = Uri.tryParse(href);
      if (uri == null) {
        continue;
      }

      if (uri.host == '' || uri.host == domain) {
        final Uri absoluteUri = uri.host == '' ? currentUri.resolveUri(uri) : uri;

        if (absoluteUri.host == domain && !visitedUrls.contains(absoluteUri)) {
          urlsToVisit.add(absoluteUri);
        }
      }
    }
  }

  for (final Uri uri in visitedUrls) {
    print(uri);
  }
  print(visitedUrls.length);
}
