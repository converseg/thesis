University of Iowa
Department of Mathematics Thesis LaTeX Files

October 3, 2020
Adam Wood

**** I did not create these files. They were passed down from previous graduate students. More information is in the files. I just updated the files and made them compatible with current formatting requirements ****

Instructions:

All of the inner workings of the thesis formatting is in uithesis.cls. You do not necessarily have to touch this file unless you want to change some formatting aspect of the files.

To compile the thesis, use thesis.tex. This file calls content files and then creates the PDF document of the thesis.

Content Files:

prelude.tex: Title page and front matter
thesisAbstract.tex: Abstract
thesisAbstractpublic.tex: Public abstract
thesisAck.tex: Acknowledgments
dedication.tex: Optional
epigraph.tex: Optional
chapter1.tex: A file that contains the text of Chapter 1. Create a new tex file for each chapter and include that chapter in thesis.tex.
appendix.tex: A file that contains the text of the Appendix, formatted differently than the chapter sections.
thesis.bib: The standard bibliography file

The file mycommands.tex has definitions of environments like definition, lemma, theorem, corollary, example, remark, etc. You can also add user defined commands that are particular to your thesis.

Good luck! Please continue to update these files and distribute to future graduate students for generations to come.