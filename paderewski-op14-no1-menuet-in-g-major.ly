\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Menuet célèbre"
  subtitle = \markup { "No. 1 from" \italic { Humoresques de concert, I. à l'Antique} }
  composer = "Ignacy Jan Paderewski"
  opus = "Op. 14, No. 1"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    pedalSustainStyle = #'bracket
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key g \major
  \time 3/4
  \tempo "Allegretto"
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% “REFRAIN”
%% mm. 9-14 are repeated several times in the piece verbatim

refrain.above = {
  \grace s8 -\markup \italic { a tempo } s2. |
  s2. * 5 |
}

refrain.upper = \relative {
  \slashedGrace cs''8( <c) fs, d>4-. q-. q-. |
  <b g d>
  <<
    <b g>2 \\
    { b,8\( d b d\) }
  >> |
  <c d fs a>4-. q-. q-. |
  <b d g> d8\( g b d\) |
  \slashedGrace d8( <c) fs, d>4-. q-. q-. |
  <b g d>
  <<
    <b g>2 \\
    { b,8\( d b d\) }
  >> |
}

refrain.between = {
  \grace { s8\p } s2. |
  s2. * 2 |
  s4 s4\< s8 s8\! |
  s2. * 2 |
}

refrain.lower = \relative {
  d,4-. <d' fs c'>-. q-. |
  g,, <d'' g> r |
  d,,-. <d'' fs a>-. q-. |
  g,, <d'' g b> r |
  d,,-. <d'' fs c'>-. q-. |
  g,, <d'' g> r |
}

refrain.below = {
  s4\sustainOn s4\sustainOff s4 |
  s4\sustainOn s8 s8\sustainOff s4 |
  s4\sustainOn s4\sustainOff s4 |
  s4\sustainOn s8 s8\sustainOff s4 |
  s4\sustainOn s4\sustainOff s4 |
  s4\sustainOn s8 s8\sustainOff s4 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-19
%% 1 |: 2-14 [ 1. 15-17 :| 2. 18-19 ] ||

upper.A = \relative {
  \clef treble
  \repeat volta 2 {
    d''4 d c\turn |
    b b c\turn |
    d d c\turn |
    b b c\turn |
    d2\( \grace { e16( fs } g4)\) |
    d2\( \grace { e16( fs } g4)\) |
    d2.~ |
    4 d4.->( cs8) |

    \refrain.upper
  }
  \alternative {
    { %% 1.
      <a, e' a>4 q <a e' g> |
      <a d fs> r r |
      d' d c\turn |
    }
    { %% 2.
      <b, e g b> <e g b e> <cs g' a cs> |
      <d fs a d>2 d4 |
    }
  }
}

lower.A = \relative {
  \clef bass
  <b d>4 q <a d> |

  <g d'> q <a d>
  <b d> q <a d> |
  <g d'> q <a d>
  <b d>\(\< g'\! <c, e>\) |
  <b d>\(\< g'\! <c, e>\) |
  <b d>\(\< g'4.\! e8 |
  d2.\) |

  \refrain.lower

  %% 1.
  c,4 c cs |
  d8\( e d cs c a\) |
  <g d' b'>4\arpeggio <b' d> <a d> |

  %% 2.
  <g b> <e, b' g'>\arpeggio <a e' a> |
  <d a'> d, r |
}

editorial.above.A = {
  %% marks above the grand staff
  s2. * 8 |
  \refrain.above
  s2. * 5 |
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s8.\mp s16-\markup \italic { non legato } s2 |
  s2. * 5 |
  s4-\markup \italic { rit. }
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,CENTER)
  \once \override Hairpin.to-barline = ##f
  s4\> s4 |
  s4\! s4 s4 |

  \refrain.between

  %% 1.
  s2. |
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,RIGHT)
  s8\> s8 * 4 s8\! |
  s2. |
  %% 2.
  s4\f s2 |
  s2. |
}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
  s2. * 4 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s4 s4.\sustainOn s8\sustainOff |
  s4 s4.\sustainOn s8\sustainOff |

  \refrain.below

  %% 1.
  s4\sustainOn s4 s4\sustainOff\sustainOn |
  s4\sustainOff s2 |
  s4\sustainOn s4\sustainOff s4 |
  %% 2.
  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 20-44
%% |: 20-42 [ 1. 43 :| 2. 44 ] ||

upper.B = \relative {
  \repeat volta 2 {
    <a' fs>2. |
    <b g>2. |
    <c e,>2^\( <cs g>4 |
    <d fs,>2.\) |
    <a' fs a,>2. |
    <b g b,>2. |
    <c e, c>2 <cs a g cs,>4 |
    <d a fs d>4 r d,, |
    d' d c\turn |
    b b c\turn |
    d d c\turn |
    b b c\turn |
    d16\( e fs g a b c d e fs g e\) |
    d\( e fs g
    \ottava 1
    a b c d e fs g e\) |
    \barNumberCheck 34
    \once \omit TupletBracket
    \once \omit TupletNumber
    \magnifyMusic 0.75 \tuplet 33/6 {
      \stemDown
      d8[
      -\shape #'((0 . -2) (4 . 2) (-2 . 4) (0 . -3))
      -\(
      e d b
      \ottava 0
      g e d
      e d b g e d
      e d b g e d
      e d b g]
      \change Staff = "down"
      d[ b g d g b d g b
      %%\once \slurDown
      d]\)
      \shape #'((0.5 . 1) (1 . 0.5) (0 . 2) (-0.5 . 5))
      _(
      \stemNeutral
    }
    |
    \change Staff = "up"
    \barNumberCheck 35
    d'2~)\fermata 8 cs |

    \refrain.upper
    <e, g a>4-. <e g c>-. <c d fs>-. |
  }
  \alternative {
    { <b d g>2 d4 }
    { <b d g>2 g'4 }
  }
}

lower.B = \relative {
  d8\( e' d cs d c |
  b c b a b g |
  a gs a g fs e |
  d e d cs d a\) |

  <d d,> <e e,> <d d,> <cs cs,> <d d,> <c c,> |
  <b b,> <c c,> <b b,> <a a,> <b b,> <g g,> |
  <a a,> <gs gs,> <a a,> <g g,> <fs fs,> <e e,> |
  <d d,>4 <d d'> r |
  <d g,>-> <d' b' d> <d a' d> |
  <d g d'> <d, g,>-> <d' a' d> |
  <d b' d> <d, g,>-> <d' a' d> |
  <d g d'> <d, g,>-> <d' a' d> |
  <b' d>\(\< g'\! <c, e>\) |
  <b d>\(\< g'\! <c, e>\) |
  <b d>4 r4 s4 |
  R2.\fermata |

  \refrain.lower
  <c, a'>4-. <a a'>-. <d a'>-. |
  %% 1.
  <g, d' g>2 r4 |
  %% 2.
  <g d' g>2 r4 |
}

editorial.above.B = {
  %% marks above the grand staff
  \barNumberCheck 20
  s2.-\markup \italic { poco più mosso } |
  s2. * 14 |
  %% Not using refrain.upper here because the a tempo comes an eighth note early
  s2 s8 s8 -\markup \italic { a tempo } |
  s2. * 9 |
  \barNumberCheck 45
}

editorial.between.B = {
  %% marks between the staves, e.g. dynamics
  \barNumberCheck 20
  s2.\p |
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,CENTER)
  s8\< s8 s2 |
  s2. |
  s2 s8 s8\! |
  s8\f s8 s2 |
  s2. |
  s8
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,LEFT)
  \once \override Hairpin.to-barline = ##f
  s8\< s2 |
  s4 s4\! s4 |
  s4\ff s2 |
  s2. * 3 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s16\< s8. s2 |
  s8 s16 s16\! s2 |
  \tuplet 33/6 {
    s8\f
    s8
    s8 -\markup \italic { rapidamente }
    s8 * 21
    \once \override Hairpin.Y-offset = -5
    s8\< s8 * 6 s8\! s8
  } |
  s2. |

  \refrain.between
  s2. * 3 |
}

editorial.below.B = {
  %% marks below the grand staff, e.g. pedal marks
  \barNumberCheck 20
  s2. * 7 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4\sustainOff s4 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s2. * 2
  s4\sustainOn s4 s4 |
  s4\sustainOff s4 s4 |

  \refrain.below

  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff |

  %% 1.
  s4\sustainOn s4 s4\sustainOff |
  %% 2.
  s4\sustainOn s4 s4\sustainOff |
}

breaks_ref = {
  s2. * 5 | \break
  \barNumberCheck 6 |
  s2. * 5 | \break
  \barNumberCheck 11
  s2. * 4 | \break
  \barNumberCheck 15
  s2. * 5 | \pageBreak
  \barNumberCheck 20
  s2. * 5 | \break
  \barNumberCheck 25
  s2. * 6 | \break
  \barNumberCheck 31
  s2. * 3 | \break
  \barNumberCheck 34
  s2. * 4 | \break
  \barNumberCheck 38
  s2. * 7 | \pageBreak
  \barNumberCheck 45
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above.A
      \editorial.above.B
    }
    \new Staff = "up" {
      \global
      \upper.A
      \bar "||"
      \upper.B
      \bar "||"
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \editorial.between.A
      \editorial.between.B
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \editorial.below.A
      \editorial.below.B
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
