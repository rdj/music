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
    \Staff
    \override TimeSignature.break-visibility = ##(#f #t #t)
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

global_trio = {
  \barNumberCheck 77
  \key df \major
  \time 3/4
  \mark "Trio"
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
  \barNumberCheck 77
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
  \barNumberCheck 16
  s4 |
  s2. * 60 |
  s2
  \barNumberCheck 77
}

upper.C_soprano = \relative {
  \oneVoice
  f'4 |
  f2\( gf8 f\) |
  ef2\( f8 ef\) |
  s2. |
  s2 <af df, af>4 |
  q2
  <<
    { \voiceOne bf8 af } \\
    { \voiceThree df,4 }
  >>
  |
  \oneVoice
  q4 <df' df,>( <bf bf,>) |
  <gf gf,> <bff gf ef bff> <af gf ef c af> |
  <f df af>2 <f' af, f>4 |

  \voiceOne
  f2 gf8( f) |
  ef2 f8( ef) |
  df4-.\( df-. ef-.\) |
  af,2

  \oneVoice
  <af' df, af>4 |
  q2
  <<
    { \voiceOne bf8( af) } \\
    { \voiceThree df,4 }
  >>
  |
  \oneVoice
  q4 <df' df,>( <bf bf,>) |
  <gf gf,>\( <bff gf ef bff> <af gf ef c af>\) |
  <f df af>2
}

upper.C_alto = \relative {
  s4 | s2. * 4 |
  s2 bf8 af |
  s2. * 3 |
  <af' f>2. |
  <af gf>2. |
  <af f>4 <bf gf> <df bf> |
  af2 s4 |

  s2 bf8 af |
  s2. * 2 |
  s2
}

upper.C = <<
  \clef treble
  \new Voice = "soprano" {
    \voiceOne
    \upper.C_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper.C_alto
  }
>>

lower.C_tenor = \relative {
  <f af>4 |
  q2. |
  <gf af>2. |
  <f af df>4-.\( <gf bf df>-. <ef bf' df ef>-.\) |
  <ef af>2 s4 |
  s2 gf8 f |
  s2. * 7 |
  s2 gf'8 f |
  s2. * 2 |
  s2
}

lower.C_bass = \relative {
  <df, af' df>4 |
  q2. |
  <ef af c>2. |
  <f af df>4 <gf bf df> <g bf df> |
  <af c>2

  \oneVoice
  <f df' f>4 |
  q2
  <<
    { \voiceTwo gf8 f } \\
    { \voiceFour df'4 }
  >>

  \oneVoice
  <f, df' f>4 <bf bf'> <gf gf'> |
  <ef ef'> <c c'> <af af'> |
  <df df'>2

  <df' af' df>4 |
  q2. |
  <ef af c>2. |
  <f af df>4 <gf bf df> <g bf df ef> |
  <af c ef>2

  \oneVoice
  <f df' f>4 |
  q2
  <<
    { \voiceTwo gf8 f } \\
    { \voiceFour df'4 }
  >>

  \oneVoice
  <f, df' f>4\( <bf bf'> <gf gf'> |
  <ef ef'> <c c'> <af af'>\) |
  <df df'>2
}

lower.C = <<
  \clef bass
  \new Voice = "soprano" {
    \voiceOne
    \lower.C_tenor
  }
  \new Voice = "alto" {
    \voiceTwo
    \lower.C_bass
  }
>>

editorial.above.C = {
  s4 |
  \barNumberCheck 78
  s2. * 15 |
  \barNumberCheck 93
  s2
}

editorial.between.C = {
  s4\pp |
  \barNumberCheck 78
  s2. * 4 |
  s2.\< |
  s4\> s4 s4\! |
  s2. * 9 |
  \barNumberCheck 93
  s2
}

editorial.below.C = {
  s4 |
  \barNumberCheck 78
  s2. * 15 |
  \barNumberCheck 93
  s2
}

upper.D_soprano = \relative {
  \oneVoice
  <ef' af ef'>4 |
  q2
  <<
    { \voiceOne df'8 ef } \\
    { \voiceThree af,4 }
  >> |
  \oneVoice
  <c af c,>4\( <ef af, ef> <f af, f> |
  <gf af, gf> <af af,> <bf bf, af>\) |
  <ef, af, ef>2 <e af, e>4 |

  \voiceOne
  f2 gf8( f) |
  <<
    { \voiceOne ef2 d4 } \\
    { \voiceFour af2. }
  >> |
  \voiceOne
  df2 c8 bf |
  ef2 df8 c |
  df2 c8 bf |
  af4\( g gf\) |

  \oneVoice
  f2 gf8 f |
  ef2 f8 ef |
  s2. |
  s2 <af df, af>4 |
  q2
  <<
    { \voiceOne bf8 af } \\
    { \voiceThree df,4 }
  >>
  |
  \oneVoice
  q4\( <f' af, f> <ef af, ef> |
  <df f, df>2 <c af ef c>4\) |
  <df af f df>2

  <af' df, af>4 |
  q2
  <<
    { \voiceOne bf8 af } \\
    { \voiceThree df,4 }
  >>
  |
  \oneVoice
  q4

  \voiceOne
  <f' af, f> <ef af, ef> |
  <df f, df>2 <c af ef c>4 |
  <df af f df>2
}

upper.D_alto = \relative {
  s4 |
  s2 df'8 ef |
  s2. * 3 |
  <af f>2. |
  ef2 d4 |
  <g df>2 q4 |
  <fs ef>2 q4 |
  <g df>2 q4 |
  c,2. |
  s2. * 4 |
  s2 bf8 af |
  s2. * 3 |
  s2 bf'8 af |
  s4 <df af df,> <c af c,> |
  <bf f bf,>2 <af gf af,>4 |
  <af f df>2
}

upper.D = <<
  \clef treble
  \new Voice = "soprano" {
    \voiceOne
    \upper.D_soprano
  }
  \new Voice = "alto" {
    \voiceTwo
    \upper.D_alto
  }
>>

lower.D_tenor = \relative {
  s4 |
  s2 bf8 c |
  s2. * 4 |
  c2 b4 |
  s2. |
  <a ef>2 a4 |
  s2. |
  ef2( af4) |
  <af f>2. |
  <af gf>2. |
  <df af f>4-.\( <df bf gf>-. <ef df bf ef,>-.\) |
  <af, ef>2 s4 |
  s2
  <<
    { \voiceOne gf8 f } \\
    { \voiceThree df4 }
  >>
  |
  \voiceOne
  s2. * 3 |
  s2 gf'8 f |
  s2. * 2 |
  s2
}

lower.D_bass = \relative {
  \oneVoice
  <c af' c>4 |
  q2
  <<
    { \voiceFour bf8 c } \\
    { \voiceTwo af'4 }
  >> |
  \oneVoice
  <af, af'>4 <c af' c> <df af' df> |
  <ef af ef'> <f af f'> <gf af gf'> |
  <c, af' c>2. |

  <df af' df>2. |
  <<
    { \voiceFour af'2. } \\
    { \voiceTwo c,2 b4 }
  >> |
  \oneVoice
  <bf ef bf'>2 ef4 |
  \voiceTwo
  a,2 ef'4 |
  \oneVoice
  <bf ef bf'>2 ef4 |
  \voiceTwo
  af,2. |
  <df, af' df>2. |
  <ef af c>2. |
  <f af df>4 <gf bf df> <g bf df> |
  <af c>2
  \oneVoice
  <f df' f>4 |
  q2
  \voiceTwo
  gf8 f |
  \oneVoice
  <f df' f>4 <df' af' df> <c af' c> |
  <bf f' bf>2 <af af' bf>4 |
  <df f af>2 <f df' f>4 |
  q2
  <<
    { \voiceFour df'4 } \\
    { \voiceTwo ef,8 df }
  >> |
  \oneVoice
  <df df' f>4
  s2 |
  s2. |
  s2
}

lower.D = <<
  \clef bass
  \new Voice = "soprano" {
    \voiceOne
    \lower.D_tenor
  }
  \new Voice = "alto" {
    \voiceTwo
    \lower.D_bass
  }
>>

editorial.above.D = {
  s4 |
  \barNumberCheck 94
  s2. * 21 |
  \barNumberCheck 115
  s2
}

editorial.between.D = {
  s4\f |
  s2. |
  s4\< s2 |
  s2 s4\! |
  s2. |
  s2.\pp |
  s2. * 10 |
  s4 s4\> s4 |
  s2\! s4 |
  s2. * 2 |
  s4 s4\> s4 |
  s2\! s4 |
  s2
}

editorial.below.D = {
  s4 |
  \barNumberCheck 94
  s2. * 20 |
  \barNumberCheck 114
  s2 s4^\markup { \tiny \italic { Allegretto D.C. } }
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
  s2. * 7 | \pageBreak
  \barNumberCheck 40
  s2. * 10 | \break
  \barNumberCheck 50
  s2. * 11 | \break
  \barNumberCheck 61
  s2. * 8 | \break
  \barNumberCheck 69
  s2. * 8 |
  s2 \break
  \barNumberCheck 77
  \global_trio
  \pageBreak
  s4 |
  s2. * 9 | \break
  \barNumberCheck 87
  s2. * 10 | \break
  \barNumberCheck 97
  s2. * 10 | \break
  \barNumberCheck 107
  s2. * 8 | s2
}

breaks = {
  s4 |
  s2. * 76 |
  s2 \break
  \barNumberCheck 77
  \global_trio
  \pageBreak
}

\score {
  \new PianoStaff \with { instrumentName = \markup { \abs-fontsize #18 { "6." } } } <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global_allegretto
      \editorial.above.A
      \editorial.above.B
      \global_trio
      \editorial.above.C
      \editorial.above.D
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
      \global_trio
      \upper.C
      \repeat volta 2
      {
        \upper.D
      }
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global_allegretto
      \editorial.between.A
      \editorial.between.B
      \global_trio
      \editorial.between.C
      \editorial.between.D
    }
    \new Staff = "down" {
      \global_allegretto
      \lower.A
      \lower.B
      \global_trio
      \lower.C
      \lower.D
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global_allegretto
      \editorial.below.A
      \editorial.below.B
      \global_trio
      \editorial.below.C
      \editorial.below.D
    }
    \new Dynamics {
      \global_allegretto
      \breaks_ref
    }
  >>
}
