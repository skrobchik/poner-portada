#!/bin/bash

current_dir="$(pwd)";

cd "$(dirname "$(realpath "$0")")"

source defaults.sh

if [[ $# -ge 1 ]] ; then
  source_pdf_path=$1
elif [[ -z "$source_pdf_path" ]] ; then
    read -p "Source pdf path: " source_pdf_path
fi


if [[ -z "$student_name" ]] ; then
  read -p "Student name: " student_name
fi

if [[ -z "$faculty_name" ]] ; then
  read -p "Faculty name: " faculty_name
fi

if [[ -z "$university_name" ]] ; then
  read -p "University name: " university_name
fi

if [[ -z "$due_date" ]] ; then
  read -p "Due date: " due_date
fi

if [[ -z "$work_name" ]] ; then
  read -p "Work name: " work_name
fi

if [[ -z "$subject_name" ]] ; then
  read -p "Subject name: " subject_name
fi

echo "\\newcommand{\\materia}{$subject_name}" > temp.tex
echo "\\newcommand{\\alumno}{$student_name}" >> temp.tex
echo "\\newcommand{\\trabajo}{$work_name}" >> temp.tex
echo "\\newcommand{\\universidad}{$university_name}" >> temp.tex
echo "\\newcommand{\\facultad}{$faculty_name}" >> temp.tex
echo "\\newcommand{\\fecha}{$due_date}" >> temp.tex
cat main.tex >> temp.tex

pdflatex temp.tex

temp_pdf_path="$(pwd)"/temp.pdf

cd "$current_dir"

if [[ $# -ge 2 ]] ; then
  out_pdf_path=$2
else
  out_pdf_path=out.pdf
fi

pdftk "$temp_pdf_path" "$source_pdf_path" cat output "$out_pdf_path"

echo "Portada añadida!"