%%
%% This is file `caplain.bst',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% merlin.mbs  (with options: `head,exlang,catalan,nom,and-xcom,{}')
%% catalan.mbs  (with options: `exlang,catalan,nom,and-xcom,{}')
%% merlin.mbs  (with options: `tail,exlang,catalan,nom,and-xcom,{}')
%% ----------------------------------------
%% *** ca(talan)plain BibTeX style, by Robert Fuster 18/05/1998 ***
%% *** modified 18/11/2004 ***
%% Changes: 18/11/04: added date as optional field in unpublished 
%%                    (as in standard plain style)
%%          18/11/04: now the title field in mastersthesis is not emphasized 
%%                    (as in standard plain style)
%% 
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{merlin.mbs}[1996/12/16 3.82 (PWD)]
 %
 % NOTICE:
 % This file may be used for non-profit purposes.
 % It may not be distributed in exchange for money,
 %   other than distribution costs.
 %
 % The author provides it `as is' and does not guarantee it in any way.
 %
 % Copyright (C) 1994, 1995, 1996 Patrick W. Daly
 %-------------------------------------------------------------------
 %   For use with BibTeX version 0.99a or later
 %-------------------------------------------------------------------
 % This bibliography style file is intended for texts in
 %   CATALAN
 % This is a numerical citation style, and as such is standard LaTeX.
 % It requires no extra package to interface to the main text.
 % The form of the \bibitem entries is
 %   \bibitem{key}...
 % Usage of \cite is as follows:
 %   \cite{key} ==>>          [#]
 %   \cite[chap. 2]{key} ==>> [#, chap. 2]
 % where # is a number determined by the ordering in the reference list.
 % The order in the reference list is alphabetical by authors.
 %---------------------------------------------------------------------

ENTRY
  { address
    author
    booktitle
    chapter
    edition
    editor
    howpublished
    institution
    journal
    key
    month
    note
    number
    organization
    pages
    publisher
    school
    series
    title
    type
    volume
    year
  }
  {}
  { label }

INTEGERS { output.state before.all mid.sentence after.sentence after.block }

FUNCTION {init.state.consts}
{ #0 'before.all :=
  #1 'mid.sentence :=
  #2 'after.sentence :=
  #3 'after.block :=
}

STRINGS { s t }

FUNCTION {output.nonnull}
{ 's :=
  output.state mid.sentence =
    { ", " * write$ }
    { output.state after.block =
        { add.period$ write$
          newline$
          "\newblock " write$
        }
        { output.state before.all =
            'write$
            { add.period$ " " * write$ }
          if$
        }
      if$
      mid.sentence 'output.state :=
    }
  if$
  s
}

FUNCTION {output}
{ duplicate$ empty$
    'pop$
    'output.nonnull
  if$
}

FUNCTION {output.check}
{ 't :=
  duplicate$ empty$
    { pop$ "empty " t * " in " * cite$ * warning$ }
    'output.nonnull
  if$
}

FUNCTION {fin.entry}
{ add.period$
  write$
  newline$
}

FUNCTION {new.block}
{ output.state before.all =
    'skip$
    { after.block 'output.state := }
  if$
}

FUNCTION {new.sentence}
{ output.state after.block =
    'skip$
    { output.state before.all =
        'skip$
        { after.sentence 'output.state := }
      if$
    }
  if$
}

FUNCTION {add.blank}
{  " " * before.all 'output.state :=
}

FUNCTION {date.block}
{
  new.block
}

FUNCTION {not}
{   { #0 }
    { #1 }
  if$
}

FUNCTION {and}
{   'skip$
    { pop$ #0 }
  if$
}

FUNCTION {or}
{   { pop$ #1 }
    'skip$
  if$
}

FUNCTION {non.stop}
{ duplicate$
   "}" * add.period$
   #-1 #1 substring$ "." =
}

FUNCTION {new.block.checka}
{ empty$
    'skip$
    'new.block
  if$
}

FUNCTION {new.block.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.block
  if$
}

FUNCTION {new.sentence.checka}
{ empty$
    'skip$
    'new.sentence
  if$
}

FUNCTION {new.sentence.checkb}
{ empty$
  swap$ empty$
  and
    'skip$
    'new.sentence
  if$
}

FUNCTION {field.or.null}
{ duplicate$ empty$
    { pop$ "" }
    'skip$
  if$
}

FUNCTION {emphasize}
{ duplicate$ empty$
    { pop$ "" }
    { "{\em " swap$ * "\/}" * }
  if$
}

FUNCTION {capitalize}
{ "u" change.case$ "t" change.case$ }

FUNCTION {space.word}
{ " " swap$ * " " * }

 % Here are the language-specific definitions for explicit words.
 % Each function has a name bbl.xxx where xxx is the English word.
 %-------------------------------------------------------------------
 % The original source file contains the following version information:
 % \ProvidesFile{catalan.mbs}[1998/05/17 2.0 (PWD/RF)]
 % Copyright (C) 1994, 1995 Patrick W. Daly
 % Copyright (C) 1997, 1998 Robert Fuster

 %-------------------------------------------------------------------

 % The language selected here is CATALAN
FUNCTION {bbl.and}
{ "i"}

FUNCTION {bbl.editors}
{ "editors" }

FUNCTION {bbl.editor}
{ "editor" }

FUNCTION {bbl.edby}
{ "editat per" }

FUNCTION {bbl.edition}
{ "edici\'o" }

FUNCTION {bbl.volume}
{ "volum" }

FUNCTION {bbl.of}
{ "de" }

FUNCTION {bbl.number}
{ "n\'umero" }

FUNCTION {bbl.nr}
{ "n." }

FUNCTION {bbl.in}
{ "dins" }

FUNCTION {bbl.pages}
{ "p\`agines" }

FUNCTION {bbl.page}
{ "p\`agina" }

FUNCTION {bbl.chapter}
{ "cap\'{\i}tol" }

FUNCTION {bbl.techrep}
{ "Report t{\`e}cnic" }

FUNCTION {bbl.mthesis}
{ "Projecte F. de Carrera o Tesina de L." }

FUNCTION {bbl.phdthesis}
{ "Tesi Doctoral" }

FUNCTION {bbl.first}
{ "primera" }

FUNCTION {bbl.second}
{ "segona" }

FUNCTION {bbl.third}
{ "tercera" }

FUNCTION {bbl.fourth}
{ "quarta" }

FUNCTION {bbl.fifth}
{ "cinquena" }

FUNCTION {bbl.th}
{ "a" }

MACRO {jan} {"gener"}

MACRO {feb} {"febrer"}

MACRO {mar} {"mar\c{c}"}

MACRO {apr} {"abril"}

MACRO {may} {"maig"}

MACRO {jun} {"juny"}

MACRO {jul} {"juliol"}

MACRO {aug} {"agost"}

MACRO {sep} {"setembre"}

MACRO {oct} {"octubre"}

MACRO {nov} {"novembre"}

MACRO {dec} {"desembre"}

 % End of language definition file

MACRO {acmcs} {"ACM Computing Surveys"}

MACRO {acta} {"Acta Informatica"}

MACRO {cacm} {"Communications of the ACM"}

MACRO {ibmjrd} {"IBM Journal of Research and Development"}

MACRO {ibmsj} {"IBM Systems Journal"}

MACRO {ieeese} {"IEEE Transactions on Software Engineering"}

MACRO {ieeetc} {"IEEE Transactions on Computers"}

MACRO {ieeetcad}
 {"IEEE Transactions on Computer-Aided Design of Integrated Circuits"}

MACRO {ipl} {"Information Processing Letters"}

MACRO {jacm} {"Journal of the ACM"}

MACRO {jcss} {"Journal of Computer and System Sciences"}

MACRO {scp} {"Science of Computer Programming"}

MACRO {sicomp} {"SIAM Journal on Computing"}

MACRO {tocs} {"ACM Transactions on Computer Systems"}

MACRO {tods} {"ACM Transactions on Database Systems"}

MACRO {tog} {"ACM Transactions on Graphics"}

MACRO {toms} {"ACM Transactions on Mathematical Software"}

MACRO {toois} {"ACM Transactions on Office Information Systems"}

MACRO {toplas} {"ACM Transactions on Programming Languages and Systems"}

MACRO {tcs} {"Theoretical Computer Science"}

INTEGERS { nameptr namesleft numnames }

FUNCTION {format.names}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ff~}{vv~}{ll}{, jj}" format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.names.ed}
{ 's :=
  #1 'nameptr :=
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{ff~}{vv~}{ll}{, jj}"
      format.name$ 't :=
      nameptr #1 >
        {
          namesleft #1 >
            { ", " * t * }
            {
              t "others" =
                { " et~al." * }
                { bbl.and space.word * t * }
              if$
            }
          if$
        }
        't
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {format.authors}
{ author empty$
    { "" }
    {
      author format.names
    }
  if$
}

FUNCTION {format.editors}
{ editor empty$
    { "" }
    {
      editor format.names
      editor num.names$ #1 >
        { ", " * bbl.editors * }
        { ", " * bbl.editor * }
      if$
    }
  if$
}

FUNCTION {format.in.editors}
{ editor empty$
    { "" }
    { editor format.names.ed
      editor num.names$ #1 >
        { ", " * bbl.editors * }
        { ", " * bbl.editor * }
      if$
    }
  if$
}

FUNCTION {format.title}
{ title empty$
    { "" }
    { title "t" change.case$
    }
  if$
}

FUNCTION {output.bibitem}
{ newline$
  "\bibitem{" write$
  cite$ write$
  "}" write$
  newline$
  ""
  before.all 'output.state :=
}

FUNCTION {n.dashify}
{ 't :=
  ""
    { t empty$ not }
    { t #1 #1 substring$ "-" =
        { t #1 #2 substring$ "--" = not
            { "--" *
              t #2 global.max$ substring$ 't :=
            }
            {   { t #1 #1 substring$ "-" = }
                { "-" *
                  t #2 global.max$ substring$ 't :=
                }
              while$
            }
          if$
        }
        { t #1 #1 substring$ *
          t #2 global.max$ substring$ 't :=
        }
      if$
    }
  while$
}

FUNCTION {word.in}
{ bbl.in capitalize
  " " * }

FUNCTION {format.date}
{ year empty$
    { month empty$
        { "" }
        { "there's a month but no year in " cite$ * warning$
          month
        }
      if$
    }
    { month empty$
        'year
        { month " " * year * }
      if$
    }
  if$
}

FUNCTION {format.btitle}
{ title emphasize
}

FUNCTION {tie.or.space.connect}
{ duplicate$ text.length$ #3 <
    { "~" }
    { " " }
  if$
  swap$ * *
}

FUNCTION {either.or.check}
{ empty$
    'pop$
    { "can't use both " swap$ * " fields in " * cite$ * warning$ }
  if$
}

FUNCTION {format.bvolume}
{ volume empty$
    { "" }
    { bbl.volume volume tie.or.space.connect
      series empty$
        'skip$
        { bbl.of space.word * series emphasize * }
      if$
      "volume and number" number either.or.check
    }
  if$
}

FUNCTION {format.number.series}
{ volume empty$
    { number empty$
        { series field.or.null }
        { output.state mid.sentence =
            { bbl.number }
            { bbl.number capitalize }
          if$
          number tie.or.space.connect
          series empty$
            { "there's a number but no series in " cite$ * warning$ }
            { bbl.in space.word * series * }
          if$
        }
      if$
    }
    { "" }
  if$
}

FUNCTION {is.num}
{ chr.to.int$
  duplicate$ "0" chr.to.int$ < not
  swap$ "9" chr.to.int$ > not and
}

FUNCTION {extract.num}
{ duplicate$ 't :=
  "" 's :=
  { t empty$ not }
  { t #1 #1 substring$
    t #2 global.max$ substring$ 't :=
    duplicate$ is.num
      { s swap$ * 's := }
      { pop$ "" 't := }
    if$
  }
  while$
  s empty$
    'skip$
    { pop$ s }
  if$
}

FUNCTION {convert.edition}
{ edition extract.num "l" change.case$ 's :=
  s "first" = s "1" = or
    { bbl.first 't := }
    { s "second" = s "2" = or
        { bbl.second 't := }
        { s "third" = s "3" = or
            { bbl.third 't := }
            { s "fourth" = s "4" = or
                { bbl.fourth 't := }
                { s "fifth" = s "5" = or
                    { bbl.fifth 't := }
                    { s #1 #1 substring$ is.num
                        { s bbl.th * 't := }
                        { edition 't := }
                      if$
                    }
                  if$
                }
              if$
            }
          if$
        }
      if$
    }
  if$
  t
}

FUNCTION {format.edition}
{ edition empty$
    { "" }
    { output.state mid.sentence =
        { convert.edition "l" change.case$ " " * bbl.edition * }
        { convert.edition "t" change.case$ " " * bbl.edition * }
      if$
    }
  if$
}

INTEGERS { multiresult }

FUNCTION {multi.page.check}
{ 't :=
  #0 'multiresult :=
    { multiresult not
      t empty$ not
      and
    }
    { t #1 #1 substring$
      duplicate$ "-" =
      swap$ duplicate$ "," =
      swap$ "+" =
      or or
        { #1 'multiresult := }
        { t #2 global.max$ substring$ 't := }
      if$
    }
  while$
  multiresult
}

FUNCTION {format.pages}
{ pages empty$
    { "" }
    { pages multi.page.check
        { bbl.pages pages n.dashify tie.or.space.connect }
        { bbl.page pages tie.or.space.connect }
      if$
    }
  if$
}

FUNCTION {format.journal.pages}
{
  pages empty$
    'skip$
    { duplicate$ empty$
        { pop$ format.pages }
        { ":" * pages n.dashify * }
      if$
    }
  if$
}

FUNCTION {format.vol.num.pages}
{ volume field.or.null
  number empty$
    'skip$
    {
      "(" number * ")" * *
      volume empty$
        { "there's a number but no volume in " cite$ * warning$ }
        'skip$
      if$
    }
  if$
  format.journal.pages
}

FUNCTION {format.chapter.pages}
{ chapter empty$
    'format.pages
    { type empty$
        { bbl.chapter }
        { type "l" change.case$ }
      if$
      chapter tie.or.space.connect
      pages empty$
        'skip$
        { ", " * format.pages * }
      if$
    }
  if$
}

FUNCTION {format.in.ed.booktitle}
{ booktitle empty$
    { "" }
    { editor empty$
        { word.in booktitle emphasize * }
        { word.in format.in.editors * ", " *
          booktitle emphasize * }
      if$
    }
  if$
}

FUNCTION {empty.misc.check}
{ author empty$ title empty$ howpublished empty$
  month empty$ year empty$ note empty$
  and and and and and
  key empty$ not and
    { "all relevant fields are empty in " cite$ * warning$ }
    'skip$
  if$
}

FUNCTION {format.thesis.type}
{ type empty$
    'skip$
    { pop$
      type "t" change.case$
    }
  if$
}

FUNCTION {format.tr.number}
{ type empty$
    { bbl.techrep }
    'type
  if$
  number empty$
    { "t" change.case$ }
    { number tie.or.space.connect }
  if$
}

FUNCTION {format.article.crossref}
{
  key empty$
    { journal empty$
        { "need key or journal for " cite$ * " to crossref " * crossref *
          warning$
          ""
        }
        { word.in journal emphasize * }
      if$
    }
    { word.in key * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.crossref.editor}
{ editor #1 "{vv~}{ll}" format.name$
  editor num.names$ duplicate$
  #2 >
    { pop$ " et~al." * }
    { #2 <
        'skip$
        { editor #2 "{ff }{vv }{ll}{ jj}" format.name$ "others" =
            { " et~al." * }
            { bbl.and space.word * editor #2 "{vv~}{ll}" format.name$ * }
          if$
        }
      if$
    }
  if$
}

FUNCTION {format.book.crossref}
{ volume empty$
    { "empty volume in " cite$ * "'s crossref of " * crossref * warning$
      word.in
    }
    { bbl.volume capitalize
      volume tie.or.space.connect
      bbl.of space.word *
    }
  if$
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { series empty$
            { "need editor, key, or series for " cite$ * " to crossref " *
              crossref * warning$
              "" *
            }
            { series emphasize * }
          if$
        }
        { key * }
      if$
    }
    { format.crossref.editor * }
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.incoll.inproc.crossref}
{
  editor empty$
  editor field.or.null author field.or.null =
  or
    { key empty$
        { booktitle empty$
            { "need editor, key, or booktitle for " cite$ * " to crossref " *
              crossref * warning$
              ""
            }
            { word.in booktitle emphasize * }
          if$
        }
        { word.in key * " " *}
      if$
    }
    { word.in format.crossref.editor * " " *}
  if$
  " \cite{" * crossref * "}" *
}

FUNCTION {format.publisher}
{ publisher empty$
    { "empty publisher in " cite$ * warning$ }
    'skip$
  if$
  ""
  address empty$ publisher empty$ and
    'skip$
    {
      publisher empty$
        { address empty$
          'skip$
          { address * }
          if$
        }
        { publisher *
          address empty$
            'skip$
            { ", " * address * }
          if$
        }
      if$
    }
  if$
  output
}

FUNCTION {article}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { journal
      emphasize
      "journal" output.check
      format.vol.num.pages output
      format.date "year" output.check
    }
    { format.article.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {book}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    { format.bvolume output
      new.block
      format.number.series output
      new.sentence
      format.publisher
    }
    {
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {booklet}
{ output.bibitem
  format.authors output
  new.block
  format.title "title" output.check
  new.block
  howpublished output
  address output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {inbook}
{ output.bibitem
  author empty$
    { format.editors "author and editor" output.check
    }
    { format.authors output.nonnull
      crossref missing$
        { "author and editor" editor either.or.check }
        'skip$
      if$
    }
  if$
  new.block
  format.btitle "title" output.check
  crossref missing$
    {
      format.bvolume output
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.number.series output
      new.sentence
      format.publisher
    }
    {
      format.chapter.pages "chapter and pages" output.check
      new.block
      format.book.crossref output.nonnull
    }
  if$
  format.edition output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {incollection}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.chapter.pages output
      new.sentence
      format.publisher
      format.edition output
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.chapter.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {inproceedings}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  crossref missing$
    { format.in.ed.booktitle "booktitle" output.check
      format.bvolume output
      format.number.series output
      format.pages output
      new.sentence
      publisher empty$
        { organization output
          address output
        }
        { organization output
          format.publisher
        }
      if$
      format.date "year" output.check
    }
    { format.incoll.inproc.crossref output.nonnull
      format.pages output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {conference} { inproceedings }

FUNCTION {manual}
{ output.bibitem
  author empty$
    { organization empty$
        'skip$
        { organization output.nonnull
          address output
        }
      if$
    }
    { format.authors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  author empty$
    { organization empty$
    {
          address new.block.checka
          address output
        }
        'skip$
      if$
    }
    {
      organization address new.block.checkb
      organization output
      address output
    }
  if$
  format.edition output
  format.date output
  new.block
  note output
  fin.entry
}

FUNCTION {mastersthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  bbl.mthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {misc}
{ output.bibitem
  format.authors output
  title howpublished new.block.checkb
  format.title output
  howpublished new.block.checka
  howpublished output
  format.date output
  new.block
  note output
  fin.entry
  empty.misc.check
}

FUNCTION {phdthesis}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.btitle "title" output.check
  new.block
  bbl.phdthesis format.thesis.type output.nonnull
  school "school" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {proceedings}
{ output.bibitem
  editor empty$
    { organization output }
    { format.editors output.nonnull }
  if$
  new.block
  format.btitle "title" output.check
  format.bvolume output
  format.number.series output
  address empty$
    { editor empty$
        { publisher new.sentence.checka }
        { organization publisher new.sentence.checkb
          organization output
        }
      if$
      publisher output
      format.date "year" output.check
    }
    { address output.nonnull
      format.date "year" output.check
      new.sentence
      editor empty$
        'skip$
        { organization output }
      if$
      publisher output
    }
  if$
  new.block
  note output
  fin.entry
}

FUNCTION {techreport}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  format.tr.number output.nonnull
  institution "institution" output.check
  address output
  format.date "year" output.check
  new.block
  note output
  fin.entry
}

FUNCTION {unpublished}
{ output.bibitem
  format.authors "author" output.check
  new.block
  format.title "title" output.check
  new.block
  note "note" output.check
  format.date output
  fin.entry
}

FUNCTION {default.type} { misc }

READ

FUNCTION {sortify}
{ purify$
  "l" change.case$
}

INTEGERS { len }

FUNCTION {chop.word}
{ 's :=
  'len :=
  s #1 len substring$ =
    { s len #1 + global.max$ substring$ }
    's
  if$
}

FUNCTION {sort.format.names}
{ 's :=
  #1 'nameptr :=
  ""
  s num.names$ 'numnames :=
  numnames 'namesleft :=
    { namesleft #0 > }
    { s nameptr
      "{vv{ } }{ll{ }}{  ff{ }}{  jj{ }}"
      format.name$ 't :=
      nameptr #1 >
        {
          "   "  *
          namesleft #1 = t "others" = and
            { "aaaaa" * }
            { t sortify * }
          if$
        }
        { t sortify * }
      if$
      nameptr #1 + 'nameptr :=
      namesleft #1 - 'namesleft :=
    }
  while$
}

FUNCTION {sort.format.title}
{ 't :=
  "A " #2
    "An " #3
      "The " #4 t chop.word
    chop.word
  chop.word
  sortify
  #1 global.max$ substring$
}

FUNCTION {author.sort}
{ author empty$
    { key empty$
        { "to sort, need author or key in " cite$ * warning$
          ""
        }
        { key sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.editor.sort}
{ author empty$
    { editor empty$
        { key empty$
            { "to sort, need author, editor, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { editor sort.format.names }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {author.organization.sort}
{ author empty$
    { organization empty$
        { key empty$
            { "to sort, need author, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { author sort.format.names }
  if$
}

FUNCTION {editor.organization.sort}
{ editor empty$
    { organization empty$
        { key empty$
            { "to sort, need editor, organization, or key in " cite$ * warning$
              ""
            }
            { key sortify }
          if$
        }
        { "The " #4 organization chop.word sortify }
      if$
    }
    { editor sort.format.names }
  if$
}

FUNCTION {presort}
{ type$ "book" =
  type$ "inbook" =
  or
    'author.editor.sort
    { type$ "proceedings" =
        'editor.organization.sort
        { type$ "manual" =
            'author.organization.sort
            'author.sort
          if$
        }
      if$
    }
  if$
  "    "
  *
  year field.or.null sortify
  *
  "    "
  *
  title field.or.null
  sort.format.title
  *
  #1 entry.max$ substring$
  'sort.key$ :=
}

ITERATE {presort}

SORT

STRINGS { longest.label }

INTEGERS { number.label longest.label.width }

FUNCTION {initialize.longest.label}
{ "" 'longest.label :=
  #1 'number.label :=
  #0 'longest.label.width :=
}

FUNCTION {longest.label.pass}
{ number.label int.to.str$ 'label :=
  number.label #1 + 'number.label :=
  label width$ longest.label.width >
    { label 'longest.label :=
      label width$ 'longest.label.width :=
    }
    'skip$
  if$
}

EXECUTE {initialize.longest.label}

ITERATE {longest.label.pass}

FUNCTION {begin.bib}
{ preamble$ empty$
    'skip$
    { preamble$ write$ newline$ }
  if$
  "\begin{thebibliography}{"  longest.label  * "}" *
  write$ newline$
}

EXECUTE {begin.bib}

EXECUTE {init.state.consts}

ITERATE {call.type$}

FUNCTION {end.bib}
{ newline$
  "\end{thebibliography}" write$ newline$
}

EXECUTE {end.bib}
%% End of customized bst file
%%
%% End of file `caplain.bst'.
