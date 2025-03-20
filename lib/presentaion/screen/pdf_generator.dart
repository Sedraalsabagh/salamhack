import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:devloper_app/data/models/cvmodel.dart';

Future<Uint8List> generateCvPdf(CVModel cvModel) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.MultiPage(
      build: (pw.Context context) => [
        pw.Text('Curriculum Vitae',
            style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
        pw.SizedBox(height: 20),
        if (cvModel.username != null) pw.Text('Name: ${cvModel.username}'),
        if (cvModel.email != null) pw.Text('Email: ${cvModel.email}'),
        if (cvModel.phone != null) pw.Text('Phone: ${cvModel.phone}'),
        if (cvModel.location != null) pw.Text('Location: ${cvModel.location}'),
        if (cvModel.githubLink != null)
          pw.Text('GitHub: ${cvModel.githubLink}'),
        if (cvModel.linkedinLink != null)
          pw.Text('LinkedIn: ${cvModel.linkedinLink}'),
        if (cvModel.summary != null) pw.Text('Summary: ${cvModel.summary}'),
        pw.SizedBox(height: 20),
        pw.Text('Skills:',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ...?cvModel.skills?.map((s) => pw.Text('- ${s.skill} (${s.level})')),
        pw.SizedBox(height: 20),
        pw.Text('Education:',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ...?cvModel.education?.map((edu) => pw.Column(children: [
              pw.Text('${edu.degree} at ${edu.institution}'),
              if (edu.description != null) pw.Text(edu.description!),
              pw.Text('From ${edu.startDate} to ${edu.endDate}'),
              pw.SizedBox(height: 10),
            ])),
        pw.SizedBox(height: 20),
        pw.Text('Projects:',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ...?cvModel.projects?.map((proj) => pw.Column(children: [
              pw.Text('Title: ${proj.title}'),
              if (proj.description != null)
                pw.Text('Description: ${proj.description}'),
              if (proj.githubLink != null)
                pw.Text('GitHub: ${proj.githubLink}'),
              pw.SizedBox(height: 10),
            ])),
        pw.SizedBox(height: 20),
        pw.Text('Experience:',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ...?cvModel.experiences?.map((exp) => pw.Column(children: [
              pw.Text('${exp.jobTitle} at ${exp.company}'),
              pw.Text('From ${exp.startDate} to ${exp.endDate}'),
              if (exp.description != null)
                pw.Text('Description: ${exp.description}'),
              pw.SizedBox(height: 10),
            ])),
        pw.SizedBox(height: 20),
        pw.Text('Training Courses:',
            style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold)),
        ...?cvModel.trainingsCourses?.map((tc) => pw.Column(children: [
              pw.Text('${tc.title} at ${tc.institution}'),
              pw.Text('From ${tc.startDate} to ${tc.endDate}'),
              if (tc.description != null) pw.Text(tc.description!),
              pw.SizedBox(height: 10),
            ])),
      ],
    ),
  );

  return pdf.save();
}
