import 'package:xandra/utils/custom_snackbar.dart';
import 'package:xandra/views/base/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:url_launcher/url_launcher.dart';

class Info extends StatefulWidget {
  final String title;
  final String endpoint;
  const Info({super.key, required this.title, required this.endpoint});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  String data = """<h2>1. Creator Commissions & Earnings</h2>
<ul>
  <li>Creators on Xandra may earn commissions by promoting eligible products through uploaded content.</li>
  <li>Commission rates are determined by Xandra and may vary by product or campaign.</li>
  <li>Commissions are earned only on successfully completed and paid orders.</li>
  <li>Earnings will remain in a pending status until the order has been delivered and the applicable return or refund window has expired.</li>
  <li>If an order is refunded, cancelled, or disputed, the related commission may be reversed or adjusted.</li>
  <li>Xandra reserves the right to modify commission rates, payout rules, or eligibility criteria with prior notice.</li>
</ul>

<h2>2. Payouts & Withdrawals</h2>
<ul>
  <li>Creators may withdraw available earnings once they meet the minimum withdrawal threshold displayed in the app.</li>
  <li>Withdrawals are processed through supported payout methods (e.g., UAE bank transfer).</li>
  <li>Processing time typically ranges from 2–5 business days.</li>
</ul>""";

  @override
  void initState() {
    super.initState();
    // call the endpoint
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Html(
            data:
                cleanHtml(data) ??
                "<p style=\"color: red; text-align: center;\">${"error_fetching_data".tr}</p>",
            style: {
              "p": Style(fontSize: FontSize(16), lineHeight: LineHeight(1.5)),
              "strong": Style(
                fontWeight: FontWeight.bold,
                fontSize: FontSize(16),
              ),
              "em": Style(fontStyle: FontStyle.italic),
              "li": Style(fontSize: FontSize(16)),
              "ul": Style(padding: HtmlPaddings(left: HtmlPadding(20))),
              "ol": Style(padding: HtmlPaddings(left: HtmlPadding(20))),
              "a": Style(
                color: Colors.blueAccent,
                textDecoration: TextDecoration.underline,
              ),
            },
            onLinkTap: (link, attributes, element) async {
              var url = Uri.parse(link ?? "");

              if (await canLaunchUrl(url)) {
                launchUrl(url);
              } else {
                customSnackBar("Can't launch URL");
              }
            },
          ),
        ),
      ),
    );
  }

  /// Cleans HTML from React Quill and other sources
  String? cleanHtml(String? rawHtml) {
    if (rawHtml == null || rawHtml.trim().isEmpty) return null;

    final unescape = HtmlUnescape();

    // Remove leading/trailing whitespace and fix smart quotes
    String cleaned = rawHtml
        .replaceAll('“', '"')
        .replaceAll('”', '"')
        .replaceAll('’', "'")
        .replaceAll('\u2028', '') // line separator
        .replaceAll('\u00A0', ' ') // non-breaking space
        .replaceAll('\r', '');

    // Remove any leading closing tags that break flutter_html
    cleaned = cleaned.replaceAll(RegExp(r'^<\/p>|^<\/div>'), '');

    // Remove scripts for safety
    cleaned = cleaned.replaceAll(
      RegExp(r'<script[^>]*>.*?<\/script>', dotAll: true),
      '',
    );

    return unescape.convert(cleaned.trim());
  }
}
