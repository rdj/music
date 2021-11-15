\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  indent = 0
  print-page-number = ##f
}

#(set-global-staff-size 20)

\paper {
    top-margin = 8\mm                              %-minimum: 8 mm
    top-markup-spacing.basic-distance = #6         %-dist. from bottom of top margin to the first markup/title
    markup-system-spacing.basic-distance = #5      %-dist. from header/title to first system
    top-system-spacing.basic-distance = #12        %-dist. from top margin to system in pages with no titles
    last-bottom-spacing.padding = #2               %-min #1.5 -pads music from copyright block
    ragged-bottom = ##f
    ragged-last-bottom = ##f
}


\header {
  title = "Bagatelle in A minor (“Für Elise”)"
  subsubtitle = \markup { "From" \italic "Neue Briefe Beethovens" "(1867)" }
  composer = "Ludwig van Beethoven"
  opus = "WoO 59 (1810)"
  tagline = ##f
}

%% NOTE CHOICE - MEASURE 7
%%
%% There is significant debate about whether the E4 in measure 7
%% should actually be a D4. This piece was published after Beethoven's
%% death, and there is no surviving autograph.
%%
%% The first edition uses E4 in measure 7, but then D4 for every
%% restatement, including bar 22 which is repeated twice before the B
%% section. I could not find any modern editions that have copied the
%% first edition, so the consensus certainly seems to find the first
%% edition to be in error.
%%
%% Some scholars argue that the simpliest correction is to replace the
%% E4 in measure 7 with a D4, which makes the first edition
%% consistent. For example, see:
%% https://www.henle.de/blog/en/2011/11/30/beethoven-fur-elise-woo-59-%E2%80%93-do-you-strike-the-right-note/
%%
%% The most popular approach, which was taken by all three copies of
%% this piece I have sitting on my shelf (Bastien, Alfred, and
%% Suzuki), is to use E4 throughout the piece, but to use D4 in the
%% penultimate measure to provide a final strong cadence to close the
%% piece. This is the course I have chosen.

%% NOTE CHOICE - MEASURE 30
%%
%% The note in question is the fourth note in the bass clef. It is an
%% F in the first edition, but many editions substitute an E.
%%
%% First Ed G E G F G F
%% Commonly G E G E G F
%%
%% Unlike measure 7, I wasn't able to find information online to
%% explain this discrepency. This is the same measure where many
%% editions (contrary to the first) show a turn in the right hand that
%% is played over the note in question, so maybe the ornament and the
%% changed bass are related. I am sticking to the first edition here.

%% PEDAL MARKS
%%
%% The pedal marks are terribly inconsistent within the first edition.
%%
%% Subsequent editions fall into one of several cateogories:
%%
%%   * Copy the first edition, inconsistencies and all
%%
%%   * Make minimal changes to first ed. to improve consistency
%%
%%   * Omit pedal markings
%%
%%   * Write a new pedal part appropriate to the modern piano and
%%     the editor's taste. These almost always shorten the pedal
%%     marks in the A section, and often they include common sense
%%     lift-every-chord-change explicit marks for the C section.
%%
%%   * Reproduce the first group of pedal marks from the first ed.,
%%     then "Ped. simile" and trust the performer to figure it out.
%%
%% I am going with the last choice. I will also include the only
%% explicit pedal mark outside the A section from the first ed.
%%
%% I'd also like to include a pedal mark around measure 12, but that's
%% actually one of the places where the first edition is inconsistent,
%% sometimes (in my opinion, erroneously) holding the pedal through
%% from the previous measure.

%% PHRASING AND BEAMING
%%
%% I have reproduced the phrasing and beaming from the first edition.
%% There are only a few phrase markings. And, unusually, there is a
%% pair of sixteenth notes beamed across the mm. 50-51 bar line.
%% Curiously, many other editions also beam across the mm. 51-52 bar
%% line, but that's contrary to the first ed., so I've left it as is.

global = {
  \key a \minor
  \time 3/8
}

Section-A-Part-I-RH = { %% mm. 2-7
  a8 r16 c, e a |
  b8 r16 e, gs b |
  c8 r16 e, e' ds |
  e ds e b d c |
  a8 r16 c, e a |
  b8 r16 e, c' b | %% see note (m. 7)
}

Section-A-Part-II-RH = { %% m. 9
  a8 r16 b c d |
}

Section-A-Part-III-RH = { %% mm. 10-20
  e8. g,16[ f' e] |
  d8. f,16[ e' d] |
  c8. e,16[ d' c] |
  b8 r16 e, e' r16 |
  r e e' r r ds, |
  e8 r16 ds e ds |
  e ds e b d c |
  a8 r16 c, e a |
  b8 r16 e, gs b |
  c8 r16 e, e' ds |
  e ds e b d c |
  a8 r16 c, e a |
}

Section-A-Part-IV-RH = { %% m. 21 (e4)
  b8 r16 e, c' b |
}


Section-A-Again-RH = {
  \Section-A-Part-I-RH
  \Section-A-Part-II-RH
  \Section-A-Part-III-RH
  \Section-A-Part-IV-RH
}

Section-A-Final-RH = {
  \Section-A-Part-I-RH
  \Section-A-Part-II-RH
  \Section-A-Part-III-RH
}


upperStaff = {
  \tempo "Poco moto"
  \relative c'' {
    \repeat volta 2 {
      \partial 8 e16\pp ds |
      e ds e b d c |
      \Section-A-Part-I-RH
    }
    \alternative {
      { a4 }
      { \Section-A-Part-II-RH }
    }
    \repeat volta 2 {
      \Section-A-Part-III-RH
      \Section-A-Part-IV-RH
    }
    \alternative {
      { a8 r16 b c d | \pageBreak }
      { a8 r16 <c e,> <c f,> <c g e> | }
    }

    %% B Section
    \grace { f,16 a } c4 f16. e32 |
    e8\( d\) bf'16. a32 |
    a16\( g f e d c\) |
    bf8[ a] \acciaccatura bf a32 g a bf |
    c4 d16 ds |
    e8. e16 f a, |
    c4 d16. b32 |
    c[ g' g, g'] a,[ g' b, g'] c,[ g' d g] |
    e[ g c b] a[ g f e] d[ g f d] |
    c[ g' g, g'] a,[ g' b, g'] c,[ g' d g] |
    e[ g c b] a[ g f e] d[ g f d] |
    e[ f e ds] e[ b e ds] e[ b e ds] |
    e8. b16[ e ds] |
    e8. b16[\( e]\) ds\( |
    e\) ds[\( e]\) ds[\( e]\) ds\( |
    e\) ds e b d c |

    \Section-A-Again-RH \pageBreak

    %% C Section
    a8 r r |
    <cs bf g e>4. |
    <d a f>4 <e cs>16 <f d> |
    <f d gs,>4 q8 |
    <e c a>4. |
    <d f,>4 <c e,>16 <b d,> |
    <a fs c>4 <a c,>8 |
    q <c e,> <b d,> |
    <a c,>4. |
    <cs bf g e>4. |
    <d a f>4 <e cs>16 <f d> |
    q4 q8 |
    q4. |
    <ef g,>4 <d f,>16 <c ef,> |
    <bf f d>4 <a f d>8 |
    <gs f d>4 q8 |
    <a e! c>4 r8 |
    <b e,>8 r r |
    \tuplet 3/2 { a,16[\pp c e] }
    \tuplet 3/2 { a[ c e] }
    \tuplet 3/2 { d[ c b] } |
    \tuplet 3/2 { a[ c e] }
    \tuplet 3/2 { a[ c e] }
    \tuplet 3/2 { d[ c b] } |
    \ottava #1
    \tuplet 3/2 { a[ c e] }
    \tuplet 3/2 { a[ c e] }
    \tuplet 3/2 { d[ c b] } |
    \tuplet 3/2 { bf[ a gs] }
    \tuplet 3/2 { g[ \ottava #0 fs f] }
    \tuplet 3/2 { e[ ds d] } |
    \tuplet 3/2 { cs[ c b] }
    \tuplet 3/2 { bf[ a gs] }
    \tuplet 3/2 { g[ fs f] } |

    e ds e b d c |
    \Section-A-Final-RH
    b8 r16 d, c' b |
    a8 r
  }
  \bar "|."
}

Section-A-Part-I-LH = { %% mm. 2-7
  a16 e' a r r8 |
  e,16 e' gs r r8 |
  a,16 e' a r r8 |
  R4. |
  a,16 e' a r r8 |
  e,16 e' gs r r8 |
}

Section-A-Part-II-LH = { %% m. 9
  a,16 e' a r r8 |
}

Section-A-Part-III-LH = { %% mm. 10-22
  c,16 g' c r r8 |
  g,16 g' b r r8 |
  a,16 e' a r r8 |
  e,16 e' e' r r \clef treble \stemDown e[\( |
  e']\) \stemNeutral r r ds e r |
  r ds e r r8 |
  R4. | \clef bass
  a,,,16 e' a r r8 |
  e,16 e' gs r r8 |
  a,16 e' a r r8 |
  R4. |
  a,16 e' a r r8 |
  e,16 e' gs r r8 |
}

Section-A-Again-LH = {
  \relative c {
    \Section-A-Part-I-LH
    \Section-A-Part-II-LH
    \Section-A-Part-III-LH
  }
}

lowerStaff = {
  \relative c {
    r8 |
    R4. |
    \Section-A-Part-I-LH
    a,16 e' a r | % 1st ending
    \Section-A-Part-II-LH % 2nd ending

    \Section-A-Part-III-LH
    a,16 e' a r r8 | % 1st ending
    a,16 e' a <c bf> <c a> <c bf g> | % 2nd ending

    %% B Section
    f, a c a c a |
    f bf d bf d bf |
    f e' <bf g f> e <bf g f> e |
    f, a c a c a |
    f a c a c a |
    e a c a <d d,> f, |
    g e' g, f' g, f' | \clef treble %% see note (m. 30)
    <e c>8 r16 <g f> <g e> <g f d> |
    <g e c>8 \clef bass <a, f>[ <b g>] | \clef treble
    c8 r16 <g' f> <g e> <g f d> |
    <e c>8 \clef bass <a, f>[ <b g>] |
    <b gs> r r |
    R4. |
    R4. |
    R4. |
    R4. |

    \Section-A-Again-LH

    %% C Section
    \repeat unfold 5 {
      \repeat unfold 6 a,16 |
    }
    <a d,> q q q q q |
    <a ds,> q q q q q |
    <a e> q q q <gs e> q |
    <a a,> a a a a a |
    \repeat unfold 3 { a a a a a a | }
    \repeat unfold 3 { bf bf bf bf bf bf | }
    b! b b b b b |
    c4 r8 |
    <gs' e> r r |
    a,,8 r <a'' c e> |
    q r q |
    q r q |
    q r r |
    R4. |

    R4. |
    \Section-A-Again-LH
    <a, a,>8 r
  }
}

commonPedal = { s16\sustainOn s16 s8 s16 s16\sustainOff | }
skip = { s4. | }

pedalMarks = {
  s8 |
  \skip
  \repeat unfold 3 \commonPedal %% see note re: pedal
  \skip
  s4._\markup { \italic "Ped. simile" } |
  \skip
  s8 s8 % 1st ending
  \repeat unfold 70 \skip
  s4.\sustainOn |
  \repeat unfold 3 \skip
  s8 s8 \tuplet 3/2 { s16 s16 s16\sustainOff } |
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
    }
    \new Staff = "lower" {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \pedalMarks
    }
  >>
}
