\version "2.24.0"
\language "english"
\pointAndClickOff

fz = #(make-dynamic-script "fz")

%% Chopin uses regular and long >-shaped accent marks. The longer ones
%% I render with modified hairpins. See my comments in the source for
%% Waltz WN 47 [Op. posth. 69, No. 1] for more details.

long_accent_base = {
  \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
  \once \override Hairpin.thickness = 2.0
  \once \override Hairpin.height = 0.4
}

long_accent_below = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = -4
}

long_accent_above = {
  \long_accent_base
  \once \override Hairpin.self-alignment-Y = 1
}

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
  % markup-system-spacing = #0
  % top-margin = #4
  % bottom-margin = #4
}

\header {
  title = "Waltz in B minor"
  subtitle = \markup { \medium \italic { Earlier \concat { version \super ✱ } } }
  composer = "Frédéric Chopin"
  opus = "WN 19 (1829) [Op. posth. 69, No. 2]"
  tagline = ##f
}

\layout {
  \context {
    \Score
    %%\override BarNumber.break-visibility = ##(#t #t #t) % to draw every bar number
    alternativeNumberingStyle = #'numbers-with-letters
    barNumberVisibility = #first-bar-number-invisible-save-broken-bars

    %% Put a bar line before the clef in the footnote variants
    \override SystemStartBar.collapse-height = #-inf.0
  }

  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
  }
}

global = {
  \key b \minor
  \time 3/4
  \partial 4
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-16b, 1-beat anacrusis, two 1-measure voltas

upper.A_anacrusis = \relative {
  \clef treble
  fs''4~^> |
}

upper.A_repeated_in_A′ = \relative {
  d'''4 e,( cs'~) |
  8( b as g fs cs) |
  d8( g fs cs d b) |
  as2 fs'4~ |
  8( g fs cs e d) |
  b2 fs'4 |
  \slashedGrace fs8
  fs'8( cs d8 as b fs |
  a g b, c ds e |
  g fs b,8 d cs fs, |
}

upper.A = \relative {
  fs''8( g fs cs d b) |
  as2 fs'4~^> |
  8( g fs cs e d) |
  b2 fs'4~ |
  8( g es fs b d |
  d4) es,( d'->~) |
  \upper.A_repeated_in_A′
}

upper.A_volta.1 = \relative {
  \stemDown
  b'8) es, fs as b d |
  \stemNeutral
}

upper.A_volta.2 = \relative {
  b'4 r8 \fine \bar "||" fs8 b bf |
}

lower.A_anacrusis = \relative {
  \clef bass
  r4 |
}

lower.A_repeated_in_A′ = \relative {
  b,4 <g' b e> q |
  b,4 <fs' as e'> q |
  b,4 <fs' b d> q |
  cs <fs cs' e> q |
  fs, <fs' as e'> q |
  b, <fs' b d> q |
  d <fs b d> q |
  e <g c> r |
  <<
    { \voiceOne fs2 s4 } \\
    { \voiceTwo fs4 <b d> <as e'> }
  >> |
}

lower.A = \relative {
  b,4 <fs' b d> q |
  cs <fs cs' e> q |
  as, <fs' cs' e> q |
  b,4 <fs' b d> q |
  b,4 <fs' b d> q |
  b,4 <gs' b d> q |
  \lower.A_repeated_in_A′
}

lower.A_volta.1 = \relative {
  <b d>4 b, r |
}

lower.A_volta.2 = \relative {
  b, <fs' d'>8 \section r d4 |
}

editorial.above.A_anacrusis = {
  s4-\footnote
       ""
       #'(0 . 0)
       \markup \tiny \wordwrap {
         ✱ Musical text from the copy given to Wilhelm Kolberg in 1829 (Jagiellonian Library, Kraków).
       }
    -""
  |
}

editorial.above.A = {
  s2.*15 |
}

editorial.above.A_volta.1 = {
  s2. |
}

editorial.above.A_volta.2 = {
  s2. |
}

editorial.between.A_anacrusis = {
  s4-\tweak extra-offset #'(-4 . 1)
    -\markup { \italic dolente } |
}

editorial.between.A = {
  \repeat unfold 15 s2. |
}

editorial.between.A_volta.1 = {
  R2. |
}

editorial.between.A_volta.2 = {
  R2. |
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 17-32

upper.B = \relative {
  \barNumberCheck #17
  bf'4.( a8 cs e |
  g4. fs8 cs d) |
  fs4.( e8 b cs) |
  e4.( d8 cs b) |
  b4.( a8 cs e |
  g4. fs8 cs d) |
  fs4.( e8 b cs) |
  as4.( cs8 g-> cs) |
  fs,4.\( as8 cs e |
  g4. fs8 cs d\) |
  fs4.( e8 b cs) |
  e4.( d8 cs b) |
  b4.( a8 cs e |
  g4. fs8 cs d) |
  fs4. e8-.( fs'-. e-. |
  d-. cs-. c-. b-. bf-. a-. |
}

lower.B = \relative {
  \barNumberCheck #17
  cs4 <a' e' g> q |
  d, <a' d fs> q |
  a, <a' cs g'> q |
  d, <a' d fs> q |
  cs, <a' e' g> q |
  d, <a' d fs> r |
  g, <g' b e> q |
  fs, <fs' cs' e> <fs b e> |
  fs, <fs' cs' e> <fs as e'> |
  b, <fs' b d> q |
  a, <a' cs g'> q |
  d, <a' d fs> q |
  cs, <a' e' g> q |
  d, <a' d fs> r |
  g, <g' b e> r |
  fs, <fs' cs'! e> as,( |
}

editorial.above.B = {
  \barNumberCheck #17
  s2.*10 |
  \long_accent_above s8..\> s32\! s2 |
  \long_accent_above s8..\> s32\! s2 |
  s2.*4 |
}

editorial.between.B = {
  \barNumberCheck #17
  s2.*12 |
  \barNumberCheck #29
  \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  s4 s8 s16 s16\< s8 s16 s32 s32\! |
  \override Hairpin.endpoint-alignments = #`(,CENTER . ,LEFT)
  s8 s8\> s8 s8 \once \hideNotes c8\! s8 |
  s2.*2 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 33-48

upper.A′ = \relative {
  \barNumberCheck #33
  gs''8-. g-. fs-. cs-. d-. b-.) |
  as4-> r a'4( |
  gs8 g fs cs e d) |
  b4 r a'( |
  gs8 g es fs b d |
  d4) es, d'->~ |

  \upper.A_repeated_in_A′

  \relative {
    b'4) r
  }
}

lower.A′ = \relative {
  \barNumberCheck #33
  b,4) <fs' b d> q |
  cs <fs cs' e> q |
  fs, <fs' as e'> q |
  b, <fs' b d> q |
  b, <fs' b d> q |
  b, <gs' b d> q |

  \lower.A_repeated_in_A′

  b, <fs' d'>8 r8
}

editorial.above.A′ = {
  \barNumberCheck #33
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2. |
  s2 \long_accent_above s8..\> s32\! |
  s2.*12 |
}

editorial.between.A′ = {
  \barNumberCheck #33
  s2. |
  s2 s4^\fz |
  s2. |
  s2 s4^\fz |
  s2.*12 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C (TRIO) = mm. 48b3-64

upper.C = \relative {
  \key b \major
  fs'4(
  \barNumberCheck #49
  ds'8 e ds cs ds e |
  gs2) fs4 |
  ds8( e ds cs ds e |
  gs2) fs4 |

  fs ds'8.( 16 4 |
  cs) e,8.( 16 4 |
  ds) b'8.( 16 4 |
  as) cs,8.( 16 e4) |

  ds8( e ds cs ds e |
  gs2) fs4 |
  ds8( e ds cs ds e |
  gs2) fs4 |

  ds b'8.( 16 4 |
  as) cs,8.( 16 4 |
  b) gs'8.( 16 4 |
  fs) as,8.( 16 e'4) |

  ds8( e ds cs ds e |
  gs2) fs4 |
  ds8( e ds cs ds e |
  gs2) fs4 |

  fs ds'8.( 16 4 |
  cs) e,8.( 16 4 |
  ds) b'8.( 16 4 |
  as) cs,8.( 16 e4) |

  ds8( e ds cs ds e |
  g2) fs4 |
  d8( e d cs d e |
  g2 fs4) |

  fs4( e8. 16 d4 |
  d cs8. 16 b4 |
  as cs) r |

  r
  fs,^(
}

lower.C = \relative {
  \key b \major
  r4 |
  \barNumberCheck #49
  b,4 <fs' ds'> q |
  as, <fs' cs' e> q |
  b, <fs' ds'> q |
  as, <fs' cs' e> q |

  b, <fs' ds'> q |
  fs, <fs' as e'> q |
  b, <fs' ds'> q |
  fs, <fs' as e'> q |

  b, <fs' b ds> q |
  as, <fs' cs' e> q |
  b, <fs' b ds> q |
  as, <fs' cs' e> q |

  b, <fs' b ds> q |
  cs <as' cs fs> q |
  cs, <gs' cs es> q |
  fs, <fs' cs' fs> <fs cs'> |

  b, <fs' b ds> q |
  as, <fs' cs' e> q |
  b, <fs' b ds> q |
  as, <fs' cs' e> q |

  b, <fs' b ds> q |
  fs, <fs' as e'> q |
  b, <fs' b ds> q |
  fs, <fs' as e'> q |

  b, <fs' b ds> q |
  as, <fs' cs' e> q |
  b, <fs' b d> q |
  as, <fs' cs' e> q |

  b, <fs' b d> q |
  gs, <es' b'> <cs es b'> |
  fs, <cs' fs as> q |
  \shape #'((0 . 2) (0 . 1.5) (0 . 0.5) (0 . 0)) Slur
  fs,( <cs' as'>)
}

editorial.above.C = {
  \barNumberCheck #49
  s2.*16 |
}

editorial.between.C = {
  \barNumberCheck #49
  s2. |
  \long_accent_below s8..\> s32\! s2 |
  s2. |
  \long_accent_below s8..\> s32\! s2 |
  s2.*5 |
  \long_accent_below s8..\> s32\! s2 |
  s2. |
  \long_accent_below s8..\> s32\! s2 |
  s2.*5 |
  \long_accent_below s8..\> s32\! s2 |
  s2. |
  \long_accent_below s8..\> s32\! s2 |
  s2.*5 |
  \long_accent_below s8..\> s32\! s2 |
  s2. |
  \long_accent_below s8..\> s32\! s2 |
  \once \override Hairpin.endpoint-alignments = #'(-1 . 1)
  s4\> s8 s16 s16\! s4 |
  \long_accent_below s8..\> s32\! s2 |

  \once \override Hairpin.endpoint-alignments = #'(-1 . -1)
  s4\< s4\!
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% breaks_ref to match NE 2b

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*5 |
  \break \barNumberCheck #6
  s2.*6 | \break
  \break \barNumberCheck #12
  s2.*6 | %% volta 16a/16b
  \break \barNumberCheck #17
  s2.*6 |

  \pageBreak \barNumberCheck #23
  s2.*6 |
  \break \barNumberCheck #29
  s2.*5 |
  \break \barNumberCheck #34
  s2.*5 |
  \break \barNumberCheck #39
  s2.*5 |
  \break \barNumberCheck #44
  s2.*4 s2

  \pageBreak \barNumberCheck #48
  s4 | s2.*6 |
  \break \barNumberCheck #55
  s2.*6 |
  \break \barNumberCheck #61
  s2.*7 |
  \break \barNumberCheck #68
  s2.*6 |
  \break \barNumberCheck #74
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Score

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above.A_anacrusis
      \editorial.above.A
      \editorial.above.A_volta.1
      \editorial.above.A_volta.2
      \editorial.above.B
      \editorial.above.A′
      \editorial.above.C
     }
    \new Staff = "up" {
      \global
      \repeat segno 2 {
        \upper.A_anacrusis
        \repeat volta 2 {
          \upper.A
        }
        \alternative {
          \upper.A_volta.1
          \upper.A_volta.2
        }
        \upper.B
        \upper.A′
        \section
        \sectionLabel "TRIO"
        \upper.C
        \section
        \key b \minor
        \grace s32)
        \bar ""

        \once \set Score.dalSegnoTextFormatter = #(lambda (context repeat-count markups)
                                                   #{ \markup \column { "Valse" "da Capo" "al Fine" } #})
      }
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \editorial.between.A_anacrusis
      \editorial.between.A
      \editorial.between.A_volta.1
      \editorial.between.A_volta.2
      \editorial.between.B
      \editorial.between.A′
      \editorial.between.C
    }
    \new Staff = "down" {
      \global
      \lower.A_anacrusis
      \lower.A
      \lower.A_volta.1
      \lower.A_volta.2
      \lower.B
      \lower.A′
      \section
      \lower.C
      \section
      \key b \minor
      \grace s32
    }
    %% No editorial markings below the grand staff
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
