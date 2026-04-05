#!/bin/bash

OUTPUT="infoproyect.md"

echo "# 📁 Project Structure & Code Documentation" > $OUTPUT
echo "" >> $OUTPUT

echo "## 📂 Folder Structure" >> $OUTPUT
echo "" >> $OUTPUT
echo '```' >> $OUTPUT

tree -I "build|.dart_tool|.git|ios|android|linux|macos|windows" >> $OUTPUT

echo '```' >> $OUTPUT
echo "" >> $OUTPUT

echo "## 📄 Dart Files Documentation" >> $OUTPUT
echo "" >> $OUTPUT

# Recorre todos los archivos .dart
find lib -name "*.dart" | while read file
do
  filename=$(basename "$file")

  echo "---" >> $OUTPUT
  echo "" >> $OUTPUT

  echo "### 📄 File: $filename" >> $OUTPUT
  echo "" >> $OUTPUT

  echo "**📍 Path:** \`$file\`" >> $OUTPUT
  echo "" >> $OUTPUT

  echo "**🧠 Description:**" >> $OUTPUT
  echo "_This file is part of the Flutter project structure._" >> $OUTPUT
  echo "" >> $OUTPUT

  echo '```dart' >> $OUTPUT

  # 👇 AGREGA COMENTARIO AL INICIO DEL ARCHIVO
  echo "// ==============================" >> $OUTPUT
  echo "// File: $filename" >> $OUTPUT
  echo "// Path: $file" >> $OUTPUT
  echo "// ==============================" >> $OUTPUT
  echo "" >> $OUTPUT

  cat "$file" >> $OUTPUT

  echo "" >> $OUTPUT
  echo '```' >> $OUTPUT
  echo "" >> $OUTPUT

done

echo "✅ Archivo generado: $OUTPUT"