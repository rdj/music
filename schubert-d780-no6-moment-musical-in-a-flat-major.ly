\version "2.24.4"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f

  % top-system-spacing.basic-distance = #6
  % top-system-spacing.minimum-distance = #6
  % top-system-spacing.padding = #1

  % markup-system-spacing.basic-distance = #6
  % markup-system-spacing.minimum-distance = #6
  % markup-system-spacing.padding = #1

  % score-markup-spacing.basic-distance = #6
  % score-markup-spacing.minimum-distance = #6
  % score-markup-spacing.padding = #1

  % system-system-spacing.basic-distance = #6
  % system-system-spacing.minimum-distance = #6
  % system-system-spacing.padding = #1
}

\header {
  title = "Moment Musical in A-flat major"
  subsubtitle = \markup { "No. 6 from" \italic "Six Moments Musicaux" "(1828)" }
  composer = "Franz Schubert"
  opus = "D. 780, No. 6"
  tagline = ##f
}

\layout {
  \context {
    \Score
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
    % \override BarNumber.break-visibility = #all-visible
  }
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##t
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Schubert - Moment musical in A-flat major, D. 780, No. 6
%%
%% Note: The Allegretto's B section is pretty complex and could
%% certainly be futher subdivided, but I'm not sure that helps us
%% structurally with the engraving.
%%
%% Allegretto
%% |: A :|: B :|
%% Trio
%% C |: D :|
%% Allegretto D.C.

global_allegretto = {
  \key af \major
  \time 3/4
  \tempo "Allegretto"
  \partial 4
}

upper.A = \relative {
  \clef treble
  <c'' af ef>4 |
  <c^( af_~ f~>2. |
  <bf) af f>4 r <f' bf, g> |
  <f( c~ af~>2. |
  <ef) c af>4 r8
  << { ef, af c } \\ c,4. >> |
  <df' g, ef df>2 <c af ef c>4 |
  <bf ef, bf>2 <d bf af d,>4 |
  <d\=1^(
   bf-\shape #'((0.25 . -0.5) (0 . -0.5) (0 . -0.5) (0 . -0.75))^~
   af-\shape #'((-0.25 . 1.1) (0.25 . 1.75) (-0.25 . 1.75) (-0.25 . 1.5))-\=2(
   d,-\shape #'((0 . 0) (0 . 0) (0 . 0) (-0.25 . 0))-\=3(
    >2. |
  <ef\=1) bf g\=2) ef\=3)>4 r

  <c af ef>4 |
  <c^( af_~ f~>2. |
  <bf) af f>4 r <f' b, g> |
  <f( c~ g~>2. |
  <e) c g>4 r q |
  <ef df g,>2 <ef c af>4 |
  <df bf f>2 << { c8 bf } \\ <g df>4 >> |
  <bf\=1^( g df\=2-(>2. |
  <af\=1) c,\=2)>4 r
}

lower.A = \relative {
  \clef bass
  af4 |
  df2.~ |
  4 r <df f> |
  <c_~ f(>2. |
  <c ef)>4 r8 af ef c |
  <<
    { <ef g>2 <ef af>4 } \\
    { bf2 af4 }
  >> |
  <g ef' g>2 <f bf f'>4 |
  <ef bf' ef>2.~ |
  q4 r

  af'4 |
  df2.~ |
  4 r <df, df,> |
  <c c,>2.~ |
  q4 r <c' e> |
  <bf ef>2 <af ef>4 |
  df,2 ef4 |
  <af, ef'>2.~ |
  q4 r
}

editorial.above.A = {
  s4 |
  s2. * 15 |
  s2
}

editorial.between.A = {
  s4\p |
  s2. * 5 |
  s2
  \once \override Hairpin.to-barline = ##f
  s8\< s8 |
  \once \override Hairpin.to-barline = ##f
  s2.\fp\> |
  s4\! r s4\p |
  s2. |
  s2 s4\f |
  s2. |
  s2 s4\p |
  s2. * 3 |
  s2
}

editorial.below.A = {
  s4 |
  s2. * 15 |
  s2
}


upper.B = \relative {
  <cf'' af d,>4 |
  <cf~ af~ d,(>2. |
  <cf af ef)>4 r <cf af ff> |
  <cf~ af~ ff(>2. |
  <cf af ef)>4 r q |
  <<
    { bf4 ff'4. bf,8 | ef df cf4 bf } \\
    { <af ff>2.~ | q2 <ff df>4 }
  >> ||
  <af\=1^(
   ef-\shape #'((0.10 . 0.75) (2.5 . 0) (-1.0 . 0.50) (-0.50 . 0.25))~
   cf-\shape #'((0 . -0.25) (0 . -0.25) (0 . -0.25) (-0.25 . -0.25))-\=2(
   >2. |
  <g\=1) ef bf\=2)>4 r <cf af d,>4 |
  <cf~ af~ d,(>2. |
  <cf af ef)>4 r <cf af ff> |
  <cf~ af~ ff(>2. |
  <cf af ef)>4 r <cf af ff> |

  \barNumberCheck 29
  \section
  \key e \major
  <<
    { b4\( e4. b8\) | \grace b16 ds8\( cs b4 gs\) | es\( cs'4._> es,8\) | cs'8 a gs4 fs } \\
    { <gs e~>2. | e2. | cs2. | <cs fs>4 e ds }
  >> |
  <e b gs>2 \tuplet 3/2 { e8\( gs b\) } |
  <as g e cs>2 <b gs e b>4 |
  <<
    { \grace { fs16 gs } \once \omit Accidental a4. gs8 fs4 } \\
    { c4. b8 a4 } \\
    ds2.
  >> |
  <e gs,>2 \tuplet 3/2 { e8\( gs b\) } |
  <as g e cs>2 <b gs e b>4 |
  <<
    { \grace { fs16 gs } \once \omit Accidental a4. gs8 fs4 } \\
    { c4. b8 a4 } \\
    ds2.
  >> |
  <e gs,_(>2 gs4) |

  \barNumberCheck 40
  \section
  \key af \major
  <ff af>2 q4 |
  <<
    { af2 4 | 2.( | g4.) af8 bf c } \\
    { ff,4. ef8 d4 | ef2.~ | 2 r4 }
  >> |
  <df' af f>2 q4 |
  <<
    { ef16 df c df ef4 bf | df2.( | c4) } \\
    { <bf g>2 g4 | <g( bf>2. | af4) }
  >>
  r4 <f' c af> |
  q2 q4 |
  <<
    { af4. g8 <f c af>4 | \once \hideNotes f2.~ | 2\( ff4 | ef2 d4 | df2\) } \\
    { af4. g8 f4 | <g~ bf~ df~ f>2. | <g bf df>2. | bf2.~ | 2 } \\
    { \once \override NoteColumn.force-hshift = #1.75 <af c>2 }
  >>

  %% Re-enter A theme
  <c af ef>4 |
  <c^( af_~ f~>2. |
  <bf) af f>4 r <f' bf, g> |
  <f( c~ af~>2. |
  <ef) c af>4 r8
  << {
       ef, af c |
       <df( g,>2 <c) af>4 |
       bf2 <d bf>4 |
       <d( bf~>2. |
       <ef) bf>4
     }
     \\
     {
       c,4. |
       <ef df(>2 <ef c)>4 |
       <ef bf>2 <af d,>4 |
       <af-\shape #'(
         ((1.25 . 0) (2.5 . 1.75) (1 . 4) (0 . 4))
         ((0 . 4) (-0.75 . 3) (-1.5 . 1) (-1.25 . 0))
        )-\=1(
        d,-\shape #'(
         ((0.5 . 0) (1.0 . 0.5) (0.5 . 1.75) (0 . 2.5))
         ((0 . 3) (-0.75 . 2.25) (-1.5 . 0.75) (-1.25 . 0))
        )\=2(
       >2. |
       <g\=1)
        ef\=2)
       >4
     }
   >>
  r4 <c af ef>4 |
  <<
    \new Voice { \voiceOne c2~ 8 cf | bf4 }
    \new Voice { \voiceTwo <af ff>2.~ | q4 }
  >>
  r <c af ef> |
  <<
    \new Voice { \voiceOne c2~ 8 cf | bf4 }
    \new Voice { \voiceTwo <af ff>2.~ | q4 }
  >>
  r

  \barNumberCheck 65
  \section
  \key e \major
  <b gs e>4~ |
  q q q |
  q <cs a e> <d b e,> |
  <e cs e,> <d b e,> <cs a e> |
  <cf^( af ef~>2. |
  <bf) g ef>2

  \change Staff = "down"
  \voiceOne
  <b, gs>4~ |
  q q q |
  q <cs a> <d b> |
  \grace fs16 <e cs>4 <d b> <cs a>

  \change Staff = "up"
  \barNumberCheck 74
  \section
  \key af \major
  \change Staff = "down"
  <cf af>2. |
  <bf g>2. |
  af2.~ |
  2
  \change Staff = "up"
  \oneVoice
}

lower.B = \relative {
  <ff af cf>4 |
  <ff_( af~ cf~>2. |
  <ef) af cf>4  r <df! af' cf>4 |
  <df_( af'~ cf~>2. |
  <cf) af' cf>4 r q |
  <<
    { <bf' af>2.~ | q } \\
    { df,2. | bf4 cf df }
  >> |
  ef2.~ |
  4 r

  <ff af cf> |
  <ff_( af~ cf~>2. |
  <ef) af cf>4  r <df! af' cf>4 |
  <df_( af'~ cf~>2. |
  <cf) af' cf>4 r <cf ff af cf> |

  \barNumberCheck 29
  \section
  \key e \major
  < b e gs b>2. |
  q |
  <b es gs> |
  <<
    { <fs' a>4 <gs b> <a b> } \\
    b,2.
  >> |
  <e, b' e>2. |
  e2. |
  <<
    { a4. b8 c4 } \\
    e,2.
  >> |
  <e b'>2. |
  e2. |
  <<
    { a4. b8 c4 } \\
    e,2.
  >> |
  <e b'>2 r4 |

  \barNumberCheck 40
  \section
  \key af \major
  <ff' cf'>2 q4 |
  q2 <ff af>4 |
  <ef bf'>2.~ |
  q2 r4 |
  <ef f af df>2 q4 |
  <ef g bf df>2 <ef ef'>4 |
  <af ef'>2.~ |
  q4 r <af c f> |
  q2 q4 |
  <af c>2 q4 |
  <<
    { \once \hideNotes f'2.~ | 2 ff4 } \\
    { <g,~ bf~ df~ f>2. | <g bf df>2. }
  >> |
  <g ef'>2.~ |
  q2

  % Re-enter the main theme
  af4 |
  df2.~ |
  4 r <df f> |
  <c_~ f(>2. |
  <c ef)>4 r8
  <<
    { \once \mergeDifferentlyDottedOn af4. } \\
    { af8 ef c }
  >> |
  <<
    { <ef g>2 <ef af>4 } \\
    { bf2 af4 }
  >> |
  <g ef' g>2 <f bf f'>4 |
  <ef bf' ef>2.~ |
  q4 r

  \repeat unfold 2 {
    <af, af'> |
    <df df'>2.~ |
    q4 r
  }

  \barNumberCheck 65
  \section
  \key e \major
  <d d'>4~ |
  q q q |
  q <cs cs'> <b b'> |
  <a a'> <b b'> <cs cs'> |
  <ef ef'>2.~ |
  q2

  \voiceTwo
  <d' e>4~ |
  q q q |
  q <cs e> <b e> |
  <a e'> <b e> <cs e> |

  \barNumberCheck 74
  \section
  \key af \major
  ef2.~ |
  <ef, ef'>2. |
  <af af,>2.~ |
  q2
  \oneVoice
}

editorial.above.B = {
  \barNumberCheck 16
  s4 |
  s2. * 55 |
  \barNumberCheck 72
  s4\< s4 s4\! |
  s4\> s4 s4\! |
  s2. * 3 |
  s2
}

editorial.between.B = {
  s4\pp |
  s2. * 4 |
  s2.\p |
  s2. * 2 |
  s2 s4\pp |
  s2. * 4 |
  s2.\mf |
  s2. |
  s2.\p |
  s2. |
  s2 \tuplet 3/2 { s8\< s8 s8\! } |
  s2.\fp |
  s2.\pp |
  s2. |
  s2.\fp |
  s2. * 2 |
  s2.\pp |
  s2. * 3 |
  s2.-\markup { \italic cresc. } |
  s2. |
  s2.\p |
  s2 s4\f |
  s2. * 2 |
  s4\> s4 s4\! |
  s2.\p |
  s2. |
  s2. \pp |
  s2. * 5 |
  s2\< s4\! |
  s2.\f |
  s2. * 4 |
  s2 s4\ff |
  s2. |
  s4\< s4 s4\! |
  s4\> s4 s4\! |
  s2.\p |
  s2 s4\fp |
  s2. * 3 |
  s2.\pp |
  s2. * 2 |
  s2
}

editorial.below.B = {
}


breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2. * 8 | \break
  \barNumberCheck 9
  s2. * 7 | s2 \break
  \barNumberCheck 16
  s4 | s2. * 8 | \break
  \barNumberCheck 25
  s2. * 8 | \break
  \barNumberCheck 33
  s2. * 7 | \break
  \barNumberCheck 40
  s2. * 10 | \break
  \barNumberCheck 50
  s2. * 11 | \break %pageBreak
  \barNumberCheck 61
  s2. * 8 | \break
  \barNumberCheck 69
  s2. * 9 | \break
  \barNumberCheck 78
  s2. * 9 | \break
  \barNumberCheck 87
  s2. * 10 | \break
  \barNumberCheck 97
  s2. * 10 | \break
  \barNumberCheck 107
  s2. * 8 | s2
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "6." } } } <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global_allegretto
      \editorial.above.A
      \editorial.above.B
    }
    \new Staff = "up" {
      \global_allegretto
      \repeat volta 2
      {
        \upper.A
      }
      \repeat volta 2
      {
        \upper.B
      }
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global_allegretto
      \editorial.between.A
      \editorial.between.B
    }
    \new Staff = "down" {
      \global_allegretto
      \lower.A
      \lower.B
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global_allegretto
      \editorial.below.A
      \editorial.below.B
    }
    \new Dynamics {
      \global_allegretto
      \breaks_ref
    }
  >>
}
