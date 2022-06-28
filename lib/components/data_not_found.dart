import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/strings.dart';

class DataNotFoundPage extends StatelessWidget {
  final String? massage;

  const DataNotFoundPage({Key? key, @required this.massage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            AllText.ops,
            style: Theme.of(context).textTheme.headline4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outlined,
                color: Colors.red,
                size: 15,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Text(
                  AllText.ops,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
