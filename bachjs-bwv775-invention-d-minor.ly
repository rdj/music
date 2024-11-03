\version "2.24.2"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  %indent = 0
  %page-breaking = #ly:one-page-breaking
}

\header {
  title = "Invention in D minor"
  subsubtitle = \markup { "No. 4 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 775 (1723)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
  }
}

global = {
  \key d \minor
  \time 3/8
}

upperStaff = {
  \relative c' {
    d16^2 e^1 f g a bf |
    cs,^1 bf' a g f e |
    f8 a d |
    g,^1 cs e |
    d16^2 e^1 f g a bf |

    cs, bf' a g f e |
    f^3 d e f g a |
    bf, a' g f e d |
    e^3 c d e f g |
    a, g' f e d c |

    d^3 e f d e f |
    g,8 r r |
    c16 d e c d e |
    f,8 r bf~^3 |
    8 a g |
    c16^5 bf a g f e |

    f g g8.\trill f16 |
    f8 c'^5 c^2 |
    c4.~\prall |
    c4.~ |
    c4.~ |

    c16^1 bf^2 a g^3 f e |
    c' d, e fs g^1 a |
    bf a g f^3 e d |
    bf' c, d e f^1 g |
    a b^1 c d e f |

    gs, f' e d c b |
    c^3 b d c b a |
    gs^3 a gs fs e d^3 |
    c d e^1 fs gs a |
    d, c' b a^1 gs^3 fs |

    e fs gs a^1 b c |
    fs, e' d c b a |
    gs^2 a^1 b c d e |
    a, f' e d c b |
    a' gs fs e a8~ |

    16 d,^1 b8.^\prall a16^2 |
    \stemDown
    a8.^1 a16^3 bf c |
    \stemNeutral
    d,8 fs a |
    \stemUp
    bf16 g^1 a bf c d |
    \stemNeutral
    e, d' c bf a g |

    a8 f'16 e f8 |
    g, e' r |
    d16^2 e^1 f g a bf |
    cs, bf' a g f e |
    f8 d g,~ |

    g16 d'^4 cs e a, cs |
    d b^1 cs8.\trill d16 |
    d^5 c bf a g f^2 |
    bf cs,^2 d^1 e f g^1 |
    a d f,8 e16^3 d^2 |
    d4.^1 \fermata
  }
}

lowerStaff = {
  \relative c {
    R4. |
    R4. |
    d16_5 e f g a bf_2 |
    cs, bf' a g f e |
    f8 a d |

    e, g cs |
    d, d' f,_4 |
    g a bf |
    c, c' e,_4 |
    f g a |

    bf16_3 g a bf c d |
    e, d' c bf a_1 g_4 |
    a_3 f g a bf c |
    d, c' bf a g_1 f |
    e c d e f g |
    a, g' f e d_1 c |

    d bf c8_1 c, |
    f16_3 g a bf_3 c d |
    e, d' c bf a g |
    a bf c d e_2 f |
    g, f' e d c_1 bf |

    a bf c a bf c |
    fs,8 r r |
    g16_3 a bf g a bf |
    e,8 r r |
    f f' d |

    b_1 gs e |
    a16_1 gs_4 a b c d_3 |
    e4.~\prall |
    e4.~ |
    e4.~ |

    e4.~ |
    e4.~ |
    e8 e'_1 d |
    c b a |
    d_2 e f_2 |

    d e_1 e, |
    \stemUp
    a16_1 a,_4 bf c d_1 ef_2 |
    \stemNeutral
    fs, ef' d_1 c bf a |
    g8. 16_3 a bf |
    c,8 g'_2 c |

    f16_3 g a b_3 cs d |
    e, d' cs b_1 a g |
    f8_4 a d |
    e, g cs |
    d,16 e f g a bf_2 |

    cs, bf' a g f e |
    f g a8 a, |
    bf8._3 c16 bf a |
    g bf'_2 a_1 g f e |
    f g a8 a, |
    d,4. _\fermata |
  }
}

breaks = {
  s4. * 5 | \break
  s4. * 5 | \break
  s4. * 6 | \break
  s4. * 5 | \break
  s4. * 5 | \pageBreak

  s4. * 5 | \break
  s4. * 5 | \break
  s4. * 5 | \break
  s4. * 5 | \break
  s4. * 6 |
}

\score {
  \new PianoStaff <<
    \new Staff = "upper" {
      \clef treble
      \global
      \upperStaff
      \bar "|."
    }
    \new Staff = "lower" {
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
