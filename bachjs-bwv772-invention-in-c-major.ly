\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Invention in C major"
  subsubtitle = \markup { "No. 1 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 772 (1723)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
  }
}

global = {
  \key c \major
  \time 4/4

  \set Timing.beamExceptions = #'(
    (end .
      (
        ((1 . 8) . (2 2 2 2))  ;; eighths in groups of four
        ((1 . 16) . (4 4 4 4)) ;; sixteenths in groups of four
     )
   ))
}

upperStaff = {
  \relative c' {
    r16 c d e f d e c g'8 c b\prall c |
    d16 g, a b c a b g d'8[ g f\prall g] |
    e16 a g f e g f a g f e d c e d f |

    e d c b a c b d c b a g fs a g b |
    a8 d, c'8.\mordent d16 b a g fs e g fs a |
    g b a c b d c e d b32 c d16 g b,8\prall a16 g |
    g8 r r4 r16 g a b c a b g |

    fs8\prall r r4 r16 a b c d b c a |
    b8 r r4 r16 d c b a c b d |
    c8 r r4 r16 e d c b d cs e |
    d8 cs d e f a, b cs |

    d fs, gs a b c d4~ |
    16 e, fs gs a fs gs e e' d c e d c b d |
    c a' gs b a e f d gs, f' e d c8\prall b16 a |

    a a' g f e g f a g2~ |
    16 e f g a f g e f2~ |
    16 g f e d f e g f2~ |
    16 d e f g e f d e2~ |

    16 c d e f d e c d e f g a f g e |
    f g a b c a b g c8 g e\parenthesize\prall d16 c |
    c bf a g f a g bf a b c e, d c' f, b |
    <c g e>1\fermata |
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    r2 r16 c d e f d e c |
    g'8 g, r4 r16 g' a b c a b g |
    c8[ b c d] e g, a b |

    c e, fs g a b c4~ |
    16 d, e fs g e fs d g8 b, c d |
    e fs g e b8. c16 d8 d, |
    r16 g a b c a b g d'8 g fs g |

    a16 d, e fs g e fs d a'8[ d c d] |
    \clef treble
    g,16 g' f e d f e g f8[ e f d] |
    e16 a g f e g f a g8 f g e |
    f16 bf a g f a g bf a g f e d f e g |

    f e d c b d c e
    \clef bass
    d c b a gs b a c |
    b8 e, d'8.\mordent e16 c b a g fs a gs b |
    a c b d c e d f e8 a, e' e, |

    a a, r4 r16 e'' d c b d cs e |
    d2~ 16 a b c d b c a |
    b2~ 16 d c b a c b d |
    c2~ 16 g a bf c a bf g |

    a8[ bf a g] f d' c bf |
    a f' e d e16 d, e f g e f d |
    e8[ c d e] f16 d e f g8 g, |
    c,1_\fermata |
  }
}

breaks = {
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 3 | \pageBreak
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 3 |
}

\score {
  \new PianoStaff <<
    \set PianoStaff.connectArpeggios = ##t
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
    }
    \new Staff = "lower"
    {
      \clef bass
      \global
      \lowerStaff
    }
    \new Dynamics {
      \global
      \breaks
    }
  >>
}
