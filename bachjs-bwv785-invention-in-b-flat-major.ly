\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % indent = 0
  % page-breaking = #ly:one-page-breaking
}

\header {
  title = \markup { "Invention in B-flat Major" }
  subsubtitle = \markup { "No. 14 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 785 (1723)"
  tagline = ##f
}

\layout {
  \context {
    \Score
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars
  }
  \context {
    \PianoStaff
    \accidentalStyle piano
  }
}

global = {
  \key bf \major
  \time 4/4
  \autoLineBreaksOff
}

upperStaff = {
  \relative c'' {
    %% Bach: \clef soprano
    r16 bf32^1 c d c bf16 f'^3 d bf' f d^1 f32^4 ef d ef f16^5 bf,^2 d f, af^3 |
    g ef32^1 f g f ef16 bf'^3 g ef' bf g^1 bf32^4 af g af bf16^5 ef,^2 g c, ef^3 |
    a, c32 d ef d c16 a'^5 f^1 c'^3 a ef' f,32 g a g f16 c'^3 a f' c |

    d8 r r16 g32^4 f ef f g16 c,8 r r16 f32^4 ef d ef f16 |
    bf,8 r r16 ef32^4 d c d ef16 a, c32 bf a bf c16 f,8 r |

    f' f, a c f4 r |
    r8 f, bf d f4 r |
    r8 g, bf c e4 r |

    r16 f,32 g a g f16 c'^5 a^1 f' c a' ef32^3 d c d ef16 a, c^5 fs,^2 a |
    bf8 d bf g af f' af, f |
    g16^4 c,32 d ef d c16 g' ef^2 c' g^1 d' af32^3 g f g af16 d,^1 f^4 b, g' |

    ef8 r r16 c32 d ef d c16 c'8. bf16 a f32 g a g f16 |
    f'8. ef16 d bf32 c d c bf16 bf'8. af16 g bf32 af g af bf16 |

    ef, g32^4 f ef f g16 c, ef32^4 d c d ef16 a, c32^2 d ef d c16 f af,32^3 g f g af16 |
    g^1 bf32^2 c d c bf16 ef g,32^3 f ef f g16 f^1 a32^2 bf c bf a16 d f,32^3 ef d ef f16 |
    ef g32^1 a bf a g16 c ef,32^3 d c d ef16 d4

    \voiceOne
    r16 bf'32^1 c d c bf16
    \oneVoice
    |
    f'^3 d bf' f d^1 f32^4 ef d ef f16^5 bf,^2 ef bf ef g, ef32^2 f g f ef16 |
    bf' g^1 ef' bf g bf32^4 af g af bf16 ef,8 ef'~ 16 ef32^4 d c d ef16 |

    f,8 ef'~ 16 c32 d ef d c16 f d32^4 c bf c d16 f, bf c a |
    bf1\fermata |
  }
  \bar "|."
}

lowerStaff = {
  \relative c' {
    bf8 bf, d f bf4 r |
    r8 bf, ef g bf4 r |

    r8 bf, c ef a4 r |
    r16 bf32_3 c d c bf16 ef8 r r16 a,32_3 bf c bf a16 d8 r |

    r16 g,32_4 a bf a g16 c c,32_4 d ef d c16 f8 f, r16 c'' a f |
    r16 f32_4 g a g f16 c' a_5 f' c a c32_1 bf a bf c16 f, a_1 c,_5 ef |

    d bf32_3 c d c bf16 f' d_5 bf'_2 f d f32_1 ef d ef f16 bf,_4 d_1 g,_4 bf |
    e, g32_4 a bf a g16 e' c_5 g' e bf' c,32 d e d c16 g' e_5 c' g_3 |

    a8 c a f fs a_1 fs d  |
    g16_1 g,32_4 a bf a g16 d' bf_4 g' d_5 bf'_2 af32_1 g f g af16 d,_3 f bf, d |

    ef8 g ef_2 c b d_1 b g |
    c16_1 c,32_5 d ef d c16 c'8. bf16 a f32 g a g f16 f'8. ef16 |

    d_1 bf32_4 c d c bf16 bf'8. af16 g_1 ef32_4 f g f ef16 ef'8. d16 |
    c16 ef32_1 d c d ef16 a, c32_1 bf a bf c16 f, a32_3 bf c bf a16 d f,32_2 ef d ef f16 |

    ef g32_4 a bf a g16 c ef,32_2 d c d ef16 d f32_3 g a g f16 bf d,32_2 c bf c d16 |
    c ef32_3 f g f ef16 a c,32_2 bf a bf c16 bf
    %% Bach: \clef alto
    bf'32_3 c d c bf16
    \override Stem.details.beamed-lengths = #'(6)
    f' d_4
    \change Staff = "up"
    \voiceTwo
    bf'_1 f
    \change Staff = "down" |
    \oneVoice
    \revert Stem.details.beamed-lengths

    d f32_1 ef d ef f16 bf,_4 d_1 f,_5 af g ef32_4 f g f ef16 bf'_1 g_4 ef' bf |
    %% Bach: \clef bass
    g bf32_1 af g af bf16 ef,_5 g_1 bf,_4 d c f,32_4 g a g f16 c' a_5 ef'_2 c |

    a c32_1 bf a bf c16 f, a_1 c, ef d bf'32_3 c d c bf16 f'8 f, |
    bf1_\fermata |
  }
}

breaks = {

  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \pageBreak

  s1 * 2 | \break
  s1 | s2 \break
  s2 | s1 | \break
  s1 * 2 | \break
}

\score {
  \new PianoStaff <<
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
      \breaks
    }
  >>
}
