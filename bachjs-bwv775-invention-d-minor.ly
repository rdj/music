\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\header {
  title = "Invention in D minor"
  subsubtitle = \markup { "No. 4 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 775 (1723)"
  tagline = ##f
}

global = {
  \key d \minor
  \time 3/8
}

upperStaff = {
  \relative c' {
    d16 e f g a bf |
    cs, bf' a g f e |
    f8 a d |
    g, cs e |
    d16 e f g a bf |
    cs, bf' a g f e |
    f d e f g a | \break

    bf, a' g f e d |
    e c d e f g |
    a, g' f e d c |
    d e f d e f |
    g,8 r r |
    c16 d e c d e |
    f,8 r bf~ |
    8 a g | \break

    c16 bf a g f e |
    f g g8. f16 |
    f8 c' c |
    c4.~\prall |
    c4.~ |
    c4.~ |
    c16 bf a g f e |
    c' d, e fs g a | \break

    bf a g f e d |
    bf' c, d e f g |
    a b c d e f |
    gs, f' e d c b |
    c b d c b a |
    gs a gs fs e d |
    c d e fs gs a | \break

    d, c' b a gs fs |
    e fs gs a b c |
    fs, e' d c b a |
    gs a b c d e |
    a, f' e d c b |
    a' gs fs e a8~ |
    16 d, b8. a16 | \break

    a8. a16 bf c |
    d,8 fs a |
    bf16 g a bf c d |
    e, d' c bf a g |
    a8 f'16 e f8 |
    g, e' r |
    d16 e f g a bf | \break

    cs, bf' a g f e |
    f8 d g,~ |
    g16 d' cs e a, cs |
    d b cs8. d16 |
    d c bf a g f |
    bf cs, d e f g |
    a d f,8 e16 d |
    d4.\fermata
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    R4. |
    R4. |
    d16 e f g a bf |
    cs, bf' a g f e |
    f8 a d |
    e, g cs |
    d, d' f, |

    g a bf |
    c, c' e, |
    f g a |
    bf16 g a bf c d |
    e, d' c bf a g |
    a f g a bf c |
    d, c' bf a g f |
    e c d e f g |

    a, g' f e d c |
    d bf c8 c, |
    f16 g a bf c d |
    e, d' c bf a g |
    a bf c d e f |
    g, f' e d c bf |
    a bf c a bf c |
    fs,8 r r |

    g16 a bf g a bf |
    e,8 r r |
    f f' d |
    b gs e |
    a16 gs a b c d |
    e4.~\prall |
    e4.~ |

    e4.~ |
    e4.~ |
    e4.~ |
    e8 e' d |
    c b a |
    d e f |
    d e e, |

    a16 a, bf c d ef |
    gs, ef' d c bf a |
    g8. 16 a bf |
    c,8 g' c |
    f16 g a b cs d |
    e, d' cs b a g |
    f8 a d |

    e, g cs |
    d,16 e f g a bf |
    cs, bf' a g f e |
    f g a8 a, |
    bf8. c16 bf a |
    g bf' a g f e |
    f g a8 a, |
    d,4.\fermata |
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
