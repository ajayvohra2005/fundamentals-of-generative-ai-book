#!/bin/bash

# Build script for Fundamentals of Generative AI LaTeX book
# This script builds the PDF from the LaTeX source files

set -e  # Exit on any error

echo "Building Fundamentals of Generative AI PDF..."

# Change to the src directory
cd "$(dirname "$0")/../src"

# Clean up any previous build artifacts
rm -f *.aux *.log *.out *.toc *.pdf

echo "Running pdflatex (first pass)..."
pdflatex -interaction=nonstopmode book.tex

echo "Running pdflatex (second pass for references and TOC)..."
pdflatex -interaction=nonstopmode book.tex

# Check if PDF was created successfully
if [ -f "book.pdf" ]; then
    echo "✅ PDF built successfully: src/book.pdf"
    echo "📄 File size: $(du -h book.pdf | cut -f1)"
else
    echo "❌ Error: PDF was not created"
    exit 1
fi

echo "🎉 Build complete!"