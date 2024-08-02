import 'package:flutter/material.dart';

class HistoryDialog extends StatelessWidget {
  final List<String> history;

  HistoryDialog({required this.history});

  void _onHistoryItemTap(BuildContext context, String result) {
    Navigator.of(context).pop(result); // Pass the result back to the main screen
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Calculation History",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Divider(color: Colors.grey),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    history[index],
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onTap: () => _onHistoryItemTap(context, history[index]),
                );
              },
            ),
          ),
          SizedBox(height: 16.0),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                "Close",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
