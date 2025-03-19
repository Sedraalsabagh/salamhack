import 'dart:typed_data';
import 'package:devloper_app/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../../data/models/convertcvmodel.dart';

class AtsResumePdfScreen extends StatefulWidget {
  final ResumeModel resume;

  const AtsResumePdfScreen({Key? key, required this.resume}) : super(key: key);

  @override
  State<AtsResumePdfScreen> createState() => _AtsResumePdfScreenState();
}

class _AtsResumePdfScreenState extends State<AtsResumePdfScreen> {
  late Future<Uint8List> _pdfFuture;

  @override
  void initState() {
    super.initState();
    print("\n resume afte convergnace: " +
        widget.resume.education.toString() +
        "donnne ");
    _pdfFuture = _generatePdf(widget.resume);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: MyColors.myGreadient1),
          ),
          title: const Text('ATS Resume PDF'),
        ),
      ),
      body: FutureBuilder<Uint8List>(
        future: _pdfFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Error generating PDF: ${snapshot.error}'));
          } else {
            final pdfData = snapshot.data!;
            return PdfPreview(
              build: (format) async => pdfData,
              allowPrinting: true,
              allowSharing: true,
            );
          }
        },
      ),
    );
  }

  Future<Uint8List> _generatePdf(ResumeModel resume) async {
    print("\n the resumee in the generate pdf: \n" + resume.toString());
    final pdf = pw.Document();
    final personal = resume.personalDetails;

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
            padding: const pw.EdgeInsets.all(16),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('ATS Resume',
                    style: pw.TextStyle(
                        fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 16),

                // Personal Details
                pw.Text('Personal Details',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text('Name: ${personal?.name ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Text('Email: ${personal?.email ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Text('Phone: ${personal?.phone ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Text('Location: ${personal?.location ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Text('GitHub: ${personal?.githubLink ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Text('LinkedIn: ${personal?.linkedinLink ?? 'N/A'}',
                    style: const pw.TextStyle(fontSize: 16)),
                pw.Divider(),

                // Summary
                pw.Text('Summary',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                pw.Text(resume.summary?.trim().isNotEmpty == true
                    ? resume.summary!
                    : 'No summary provided.'),
                pw.Divider(),

                // Education
                pw.Text('Education',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                (resume.education != null && resume.education!.isNotEmpty)
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: resume.education!.map((edu) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 8),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('Degree: ${edu.degree ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text(
                                    'Institution: ${edu.institution ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text('Start: ${edu.startDate ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text('End: ${edu.endDate ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    : pw.Text('No education details found.'),
                pw.Divider(),

                // Projects
                pw.Text('Projects',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                (resume.projects != null && resume.projects!.isNotEmpty)
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: resume.projects!.map((proj) {
                          final desc = proj.description?.trim();
                          return pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 8),
                            child: pw.Text(desc?.isNotEmpty == true
                                ? desc!
                                : 'No project description.'),
                          );
                        }).toList(),
                      )
                    : pw.Text('No projects found.'),
                pw.Divider(),

                // Experiences
                pw.Text('Experiences',
                    style: pw.TextStyle(
                        fontSize: 18, fontWeight: pw.FontWeight.bold)),
                (resume.experiences != null && resume.experiences!.isNotEmpty)
                    ? pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: resume.experiences!.map((exp) {
                          return pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 8),
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text('Job Title: ${exp.jobTitle ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text('Company: ${exp.company ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text('Start: ${exp.startDate ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text('End: ${exp.endDate ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                                pw.Text(
                                    'Description: ${exp.description ?? 'N/A'}',
                                    style: const pw.TextStyle(fontSize: 16)),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    : pw.Text('No experiences found.'),
                pw.Divider(),

                // Trainings & Courses
              ],
            ),
          );
        },
      ),
    );

    return pdf.save();
  }
}
