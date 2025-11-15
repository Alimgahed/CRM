import 'package:crm/constant/colors.dart';
import 'package:flutter/material.dart';

/// CustomTable now supports Widgets in cells and fixed styles.
class CustomTable extends StatelessWidget {
  /// Column headers (e.g., ['Name', 'Email', 'Phone'])
  final List<String> headers;

  /// Row data: each row = list of Widgets matching header count
  final List<List<Widget>> rows;

  /// Optional fixed height (default 300)
  final double height;

  /// Optional background color for rows
  final Color? rowEvenColor;
  final Color? rowOddColor;

  const CustomTable({
    super.key,
    required this.headers,
    required this.rows,
    this.height = 300,
    this.rowEvenColor,
    this.rowOddColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          _buildHeader(),
          Divider(height: 1, color: Colors.grey.shade300),
          _buildBody(),
        ],
      ),
    );
  }

  /// ===== HEADER =====
  Widget _buildHeader() {
    const headerStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: appColor, // Fixed color (example appColor)
      fontSize: 10,
    );

    return IntrinsicHeight(
      child: Row(
        children: [
          for (int i = 0; i < headers.length; i++) ...[
            _buildCell(Text(headers[i], style: headerStyle), isHeader: true),
            if (i != headers.length - 1) _verticalDivider(),
          ],
        ],
      ),
    );
  }

  /// ===== BODY =====
  Widget _buildBody() {
    if (rows.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(32.0),
        child: Center(
          child: Text(
            'لا توجد بيانات',
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ),
      );
    }

    return SizedBox(
      height: height,
      child: ListView.separated(
        itemCount: rows.length,
        separatorBuilder: (_, __) =>
            Divider(height: 1, color: Colors.grey.shade300),
        itemBuilder: (context, rowIndex) {
          final row = rows[rowIndex];

          return Container(
            color: Colors.white,
            height: 80,
            child: IntrinsicHeight(
              child: Row(
                children: [
                  for (int i = 0; i < row.length; i++) ...[
                    _buildCell(row[i]),
                    if (i != row.length - 1) _verticalDivider(),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  /// ===== CELL BUILDER =====
  Widget _buildCell(Widget child, {bool isHeader = false}) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        child: Center(child: child),
      ),
    );
  }

  /// ===== VERTICAL DIVIDER =====
  Widget _verticalDivider() =>
      VerticalDivider(color: Colors.grey.shade300, width: 1, thickness: 1);
}
