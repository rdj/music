\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  #(set-paper-size '(cons (* 9 in) (* 12 in)))
  print-page-number = ##f
  indent = 0
  top-margin = 2
  bottom-margin = 2
  left-margin = 5
  right-margin = 5
}

\header {
  title = "Prelude No. 2 in C minor"
  subsubtitle = \markup { "from" \italic { "The Well-Tempered Clavier, Book I" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "Prelude from BWV 847 (1722)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key c \minor
  \time 4/4
}

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})

upperStaff = \relative {
  \twice { c''16 ef, d ef c ef d ef  } |
  \twice { af f e f c f e f } |
  \twice { b f ef f d f ef f } |
  \twice { c' g f g ef g f g } |
  \twice { ef' af, g af ef af g af } |
  \twice { d fs, e fs d fs e fs } |
  \twice { d' g, fs g d g fs g } |
  \twice { c e, d e c e d e } |
  \twice { c' f, e f c f e f } |
  \twice { bf f ef f d f ef f } |
  \twice { bf g f g ef g f g } |
  \twice { af g f g ef g f g } |
  \twice { af d, c d bf d c d } |
  \twice { g bf, af bf ef bf af bf } |
  \twice { f' c bf c a c bf c } |
  \twice { 
    \twice { f d c d b d c d } |
  }
  \twice { ef c b c g c b c } |
  \twice { f, ef' d ef f ef d ef } |
  \twice { fs, c' b c ef c b c } |
  \twice { ef c b c g c b c } |
  \twice { fs c b c a c b c } |
  \twice { g' c, b c d c b c } |
  \twice { af' c, b c d c b c } |
  \voiceOne
  s8.
  \change Staff = "down"
  f,16^\markup \italic { destra } af f e f b f d' b af f e f |
  s8.
  g16^\markup \italic { destra } c g fs g ef' c g' ef c af g af |
  \change Staff = "up"
  \oneVoice
  s8.
  c16 ef c b c fs c a' fs ef c b c |
  \tempo "Presto"
  r16 d' c d ef c b c a c b c d b a b |
  g b a b c a g a fs a g a b g fs g |
  d g' f g af f ef f d f ef f g ef d ef |
  \voiceOne 
  c ef d ef f d c d b d c d ef c b c |
  g c b c af f' ef f g, ef' d ef f, d' c d |
  \oneVoice
  ef, c' b c af f ef f g ef d ef f d c d |
  \tempo "Adagio"
  <<
    { e8~\arpeggio 32 c d e
    f64 g af bf c bf af g f16 g32 e
    f8~\mordent\arpeggio 32 g f e
    f32 g af g f64 ef d ef f d ef f |      
    } 
    \\
    { c4\arpeggio s4 c4\arpeggio s4 }
  >>  |
  
  \tempo "Allegro"
  b8.
  \change Staff = "down"
  \voiceOne
  d,16 f af g f b f d' f, b af g f |
  e df' bf g c af f af g bf g e af f d f |
  e g e c f d b d
  r8 r16 d e! g bf g |
  af
  \change Staff = "up"
  \oneVoice
  c f d f af c b c g f d e4\fermata |
}

lowerStaff = \relative {
  \twice { c16 g' f g ef g f g } |
  \twice {
    \twice { c, af' g af f af g af } |
  }
  \twice { c, ef d ef g ef d ef } |
  \twice { c c' bf c af c bf c } |
  \twice { c, a' g a fs a g a } |
  \twice { bf, bf' a bf g bf a bf } |
  \twice { bf, g' f g e g f g } |
  \twice { af, af' g af f af g af } |
  \twice { af, d c d f d c d } |
  \twice { g, ef' d ef g ef d ef } |
  \twice { c ef d ef af ef d ef } |
  \twice { d f ef f af f ef f } |
  \twice { ef g f g af g f g } | 
  \twice { ef a g a f a g a } |
  \twice { d, f ef f af f ef f } |
  \twice { c f e f af f e f } |
  c ef d ef f ef d ef bf ef d ef f ef d ef |
  \twice { af, c b c d c b c } |
  \twice { a ef' d ef c ef d ef } |
  \twice { g, ef' d ef f ef d ef } | 
  \twice { g, ef' d ef c ef d ef } |
  \twice {
    \twice { g, ef' d ef f ef d ef } |
  }
  \voiceTwo
  g, b d s s16 * 12 |
  g,16_\markup \italic { sinistra } c ef s s16 * 12 |
  g,16 a fs' s s16 * 12 |
  \oneVoice
  g,1~ |
  16 d'' c d ef c b c a c b c d b a b |
  g b a b c af g af f a g a b g f g |
  ef
  \change Staff = "up"
  \voiceTwo
  g' f g af f ef f d f ef f g ef d ef |
  c ef d ef f d c d ef c b c d 
  \change Staff = "down"
  \oneVoice
  b a b |
  c ef d ef f, d' c d ef, c' b c d, b' a b |
  <<
    <bf g>4\arpeggio
    \\
    c,4\arpeggio
  >>
  r4
  <<
    \once \omit Accidental
    <af' f>4\arpeggio
    \\
    c,4\arpeggio
  >>
  r4 |

  r16
  \mergeDifferentlyDottedOn
  <<
    { c,16 b'8_~ 2. }
    \\
    { c,8.~ 2. }
  >> |

  \voiceTwo
  R1 |
  r2

  \voices 3, 2 <<
    {
      \stemDown \tieDown
      c'16\rest 
      g c8~ 4~ | 1
    } \\ {
      c,2~ | 1_\fermata
    }
  >>
}

breaks_ref = {
  s1 * 3 | \break
  \barNumberCheck 4
  s1 * 3 | \break
  \barNumberCheck 7
  s1 * 3 | \break
  \barNumberCheck 10
  s1 * 3 | \break
  \barNumberCheck 13
  s1 * 3 | \break
  \barNumberCheck 16
  s1 * 3 | \pageBreak
  \barNumberCheck 19
  s1 * 3 | \break
  \barNumberCheck 22
  s1 * 3 | \break
  \barNumberCheck 25
  s1 * 3 | \break
  \barNumberCheck 28
  s1 * 3 | \break
  \barNumberCheck 31
  s1 * 3 | \break
  \barNumberCheck 34
  s1 * 2 | \break
  \barNumberCheck 36
}

\score {
  \new PianoStaff \with {
    \consists "Span_arpeggio_engraver"
    connectArpeggios = ##t
  } <<
    \new Staff = "up" {
      \clef treble
      \global
      \upperStaff
    }
    \new Staff = "down" {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
