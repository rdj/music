\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  %page-breaking = #ly:one-page-breaking
}

\header {
  title = "Invention in F major"
  subsubtitle = \markup { "No. 8 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 779 (1723)"
  tagline = ##f
}

global = {
  \key f \major
  \time 3/4
}

upperStaff = {
  \relative c' {
    r8 f a f c' f, |
    f' e16 d c d c bf a bf a g |
    f8 a c a f' c |
    a'16 c bf c a c bf c a c bf c |
    f, a g a f a g a f a g a |

    d, f e f d f e f d f e f |
    b,8 g d' b f' d |
    g16 a g f e f e d c d c bf |
    a8 d16[ c] b c b a g a g f |
    e f e d c8 c'16[ b] c8 e, |

    f[ c'] e,[ c'] d,[ b'] |
    c4 r r |
    r8 c e c g' c, |
    c' b16 a g a g f e f e d |
    c bf c a' c, a' bf, a' c, a' a, a' |

    bf,8 g bf g d' g, |
    g' f16 ef d ef d c bf c bf a | \pageBreak
    g8 bf d bf g' d |
    bf' cs, bf' cs, bf' cs, |
    d a f' d a' f |

    g16 f g bf c, bf' d, bf' e, bf' c, bf' |
    f e f a b, a' cs, a' d, a' b, a' |
    e d e g a, g' b, g' cs, g' a, g' |
    f8 d bf d g, f' |
    e c a c f, ef' |

    d16 f ef f d f ef f d f ef f |
    bf, d c d bf d c d bf d c d |
    g, bf a bf g bf a bf g bf a bf |
    e,8 c g' e bf' g |

    c16 d c bf a bf a g f g f ef |
    d8 g16[ f] e f e d c d c bf |
    a bf a g f8 f'16[ e] f8 a, |
    bf[ f'] a,[ f'] g,[ e'] |
    <f c a>4 r r |
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    R2. |
    r8 f a f c' f, |
    f' e16 d c d c bf a bf a g |
    f8 a c a f' c |
    \clef treble
    a'16 c bf c a c bf c a c bf c |

    f, a g a f a g a f a g a |
    d, f e f d f e f d f e f |
    \clef bass
    b,8 g c g e' c |
    f16 g f e d e d c b c b a |
    g8 c16[ b] a b a g f g f e |

    d e d c g' f e f g8 g, |
    r8 c e c g' c, |
    c' b16 a g a g f e f e d |
    c8 e g e c' g |
    ef' fs, ef' fs, ef' fs, |

    g f16 ef d ef d c bf c bf a |
    g8 g' bf g d' g, |
    g' f16 ef d ef d c bf c bf a |
    g f g e' g, e' f, e' g, e' e, e' |
    f, e f d' f, d' e, d' f, d' d, d' |

    bf8 g e g c, e |
    a f d f b, d |
    g e cs e a, cs |
    d,16 d' c d g, d' a d bf d g, d' |
    c, c' bf c f, c' g c a c f, c' |

    bf8 d f d bf' f |
    d'16 f ef f d f ef f d f ef f |
    bf, d c d bf d c d bf d c d |
    g, bf a bf g bf a bf g bf a bf |

    e,8 c f c a' f |
    bf16 c bf a g a g f e f e d |
    c8 f16[ e] d e d c bf c bf a |
    g a g f c' bf a bf c8 c, |
    f4 r r |
  }
}

dynamics = {
}

pedalMarks = {
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
    }
    \new Dynamics {
      \global
      \dynamics
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
