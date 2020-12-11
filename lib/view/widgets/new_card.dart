import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:hackernews/core/model/news_item.dart';

class CustomNewCard extends StatelessWidget {

  final NewsItem newsItem;

  CustomNewCard({
    Key key,
    this.newsItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var date = DateTime.fromMillisecondsSinceEpoch(newsItem.time * 1000);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: buildID(),
        title: buildTitle(),
        subtitle: buildSubtitle(date),
      ),
    );
  }

  Padding buildSubtitle(var date) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        "${newsItem.score} points  |  ${newsItem.descendants} comments | ${timeago.format(date)}",
        style: GoogleFonts.roboto(fontSize: 16),
      ),
    );
  }

  Text buildTitle() {
    return Text(
      "${newsItem.title}",
      style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
    );
  }

  Widget buildID() {
    return Opacity(
      opacity: .5,
      child: Text(
        "${newsItem.by}-▲",
        style: GoogleFonts.roboto(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
