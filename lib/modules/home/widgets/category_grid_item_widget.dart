import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/modals/news_api.dart';
import '/modules/category/view/category_view.dart';
import '../../../modals/categories_model.dart';

class CategoryGridItemWidget extends StatelessWidget {
  final Category category;
  final String heroTag;

  CategoryGridItemWidget(
      {Key? key, required this.category, required this.heroTag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
      onTap: () async {
        await Provider.of<NewsApi>(context, listen: false)
            .fetchAndSetNews(category.keyword);
        Navigator.of(context).pushNamed(CategoryScreen.routeName);
      },
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(category.imageUrl),
              radius: 60,
              child: Text(
                category.name,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
                softWrap: false,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
              // width: double.infinity,
              // padding: EdgeInsets.symmetric(horizontal: 6),
              // decoration: new BoxDecoration(
              //   borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              // ),
              // child: CachedNetworkImage(
              //         height: 36,
              //         fit: BoxFit.fitHeight,
              //         imageUrl: category.imageUrl,
              //         placeholder: (context, url) => Image.network(
              //           url,
              //           fit: BoxFit.cover,
              //         ),
              //         errorWidget: (context, url, error) => Icon(Icons.error_outline),
              //       ),
            ),
          ],
        ),
      ),
    );
  }
}
