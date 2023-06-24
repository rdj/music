\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Invention in A minor"
  subsubtitle = \markup { "No. 13 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 784 (1723)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \key a \minor
  \time 4/4
}

upperStaff = {
  \relative c' {
    r16 e^1 a^2 c b e, b' d c8[ e] gs,^2 e' |
    a,16 e a c b e, b' d \once \stemUp c8 a r4 |
    r16 e'^5 c e a,^2 c^4 e, g f8 a d f~ |
    16 d b^1 d^5 g,^2 b d, f e8 g c e~ |

    16 c a^2 c f,8 d'~ 16 b g b e,8 c'~ |
    16 a f a d,8 b' c r r4 |
    r16 g c^2 e d g, d' f e8[ g] b, g' |
    c,16 g c e d g, d' f e8[ c] g' e |

    c'16^5 a e a^5 c,^2 e a, c d8^1 fs a c |
    b16 g d g^5 b,^2 d g, b c8^1 e g b |
    a16 fs^3 ds^2 fs b, ds^5 fs,^2 a g8^1 g'~ 16 e c e |
    a,8 fs'~^5 16 d b d g,8 e'~^5 16 c a c |

    fs, g' fs e ds fs b, ds e8 r r4 |
    r16 g^2 bf g e g^5 cs, e g e cs e a, r r8 |
    r16 f'^2 a f d f^5 b,^2 d f d b d g, r r8 |
    r16 e'^2 g e c e^5 a,^1 c ds c a c^5 fs,^2 r r8 |

    r16 d'^2 f d b d^5 gs,^2 b d b gs b e, r r8 |
    r16 e a c b e, b' d \once \stemUp c8[ a]^1 gs^2 e |
    a16^2 c e c a^1 c^5 fs,^2 a c a fs a ds, c' b a |
    \stemUp gs b d b \stemNeutral gs b d, f^2 gs f d f^3 b, f'^4 e d |

    c e a e c e^4 a, c^2 ds c a c^5 fs,^2 c' b a |
    gs8[ b'] gs e r16 e a c b e, b' d |
    c a^1 c e d b^1 d^2 f e c e g f e d c |
    b^2 c^1 d e f d^1 gs^3 d b' d,^2 c a'^5 f d b d^5 |

    gs,^2 b c a e a b gs a e c^2 e a,4\fermata |
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    a8 a'4 gs8_3 a16 e a c b e, b' d |
    c8[ a]_4 gs_3 e a16 e a c b e, b' d |
    c8 a c a d16 a f_4 a_1 d, f a,_5 c_3 |
    b8 d g b~_2 16 g e g_1 c,_3 e g, b_3 |

    a8 c_1 d16_2 f b, d g,8 b c16 e a, c_1 |
    f,8_4 d \stemDown g16 g' f g \stemNeutral c,_5 g'_2 c e_2
    % Bach \clef alto
    d_1 g,_5 d'_2 f |
    e8[ c]_4 b_3 g c16 g c e d g, d' f |
    e8 c r4 r16 g' e g c, e_1 g,_5 b |

    a8 c_1 e_2 g_1 fs16 a d,_3 fs_2 a, d_1 fs,_4 a |
    g8 b_1 d_4 fs e16 g c,_4 e g,_5 c_1 e,_4 g |
    fs8 a_1 b_4 ds_2 r16 e c e a, c e_2 g |
    fs d b d_1 g, b_3 d fs e c a c_1 fs,_4 a c8~ |

    16 b c a
    % Bach \clef bass
    b8_1 b, e16 e'_1 b g e_1 b g b |
    e,8[ c'] g'_3 bf cs, r r16 g''_1 f e |
    d8_1 d, f af_2 b, r r16 f'' e d |
    c8_1 c, e fs a, r r16 e'' ds cs |

    b8_1 b, d f gs, r r16 d'' c b |
    c8[_2 a]_4 gs_3 e a16 e a c b e, b' d |
    c_4 e a e c e a,_5 c_1 fs,_4 a c a fs a_1 ds,_5 fs_3 |
    e8 gs b gs e[_1 b] gs e |

    a_3 c e c a[ c] ds, r |
    r16 b'' gs e d b' gs d_4 c8[ e]_1 gs,_4 e' |
    a,[_5 fs'] b,[ gs'] c,[_5 a'] d, bf' |
    gs[ f]_1 d[ b] gs[ a]_1 d,_4 e |

    f[ ds] e_5 e' a,2_\fermata |
  }
}

breaks_ref = {
  %% Breaks matching Henle 589, Inventionen und Sinfonien, pp. 28-29
  s1*2 |
  \break \barNumberCheck #3
  s1*2 |
  \break \barNumberCheck #5
  s1*2 |
  \break \barNumberCheck #7
  s1*2 |
  \break \barNumberCheck #9
  s1*2 |
  \break \barNumberCheck #11
  s1*3 |
  \pageBreak \barNumberCheck #14
  s1*2 |
  \break \barNumberCheck #16
  s1*2 |
  \break \barNumberCheck #18
  s1*2 |
  \break \barNumberCheck #20
  s1*2 |
  \break \barNumberCheck #22
  s1*2 |
  \break \barNumberCheck #24
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
      \breaks_ref
    }
  >>
}
