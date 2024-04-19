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
  <e g> <e, b' g'>\arpeggio <a e' a> |
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
%% B = mm. 20-44 “poco più mosso”
%% |: 20-42 [ 1. 43 :| 2. 44 ] ||

Bcore.upper = \relative {
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
  d'2~)\fermata 8 cs |

  \refrain.upper
  <e, g a>4-. <e g c>-. <c d fs>-. |
}

upper.B = \relative {
  \barNumberCheck 20
  \repeat volta 2 {
    \Bcore.upper
  }
  \alternative {
    { <b d g>2 d4 }
    { <b d g>2 g'4 }
  }
  \barNumberCheck 45
}

Bcore.lower = \relative {
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
}

lower.B = \relative {
  \barNumberCheck 20
  \Bcore.lower
  %% 1.
  <g, d' g>2 r4 |
  %% 2.
  <g d' g>2 r4 |
  \barNumberCheck 45
}

Bcore.above = {
  s2.-\markup \italic { poco più mosso } |
  s2. * 14 |
  %% Not using refrain.upper here because the a tempo comes an eighth note early
  s2 s8 s8 -\markup \italic { a tempo } |
  s2. * 7 |
}

editorial.above.B = {
  \barNumberCheck 20
  \Bcore.above
  s2. * 2 |
  \barNumberCheck 45
}

Bcore.between = {
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
  s2. |
}

editorial.between.B = {
  \barNumberCheck 20
  \Bcore.between
  s2. * 2 |
  \barNumberCheck 45
}

Bcore.below = {
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
}

editorial.below.B = {
  \barNumberCheck 20
  \Bcore.below
  %% 1.
  s4\sustainOn s4 s4\sustainOff |
  %% 2.
  s4\sustainOn s4 s4\sustainOff |
  \barNumberCheck 45
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 45-76  “con forza la melodia”

upper.C = \relative {
  \barNumberCheck 45
  g''2( d4) |
  ef4~\( 8 f g ef\) |
  g2\( d4 |
  \grace { ef16( f } g8) ef f d ef c\) |
  f2( c4) |
  d~\( 8 ef f d\) |
  f2\( c4 |
  \grace { d16( ef } f8) d ef c d bf\) |

  <<
    {
      g'2\(
      \once \override DynamicText.X-offset = #-1.5
      \once \override DynamicLineSpanner.Y-offset = #3.5
      \once \override DynamicLineSpanner.outside-staff-priority = ##f
      d4\p |
      ef4~ 8 f g ef\) |
      g2\( d4 |
      \grace { ef16( f } g8) ef f d ef c\) |
      f2\( c4 |
      d~ 8 ef f d\) |
      f2\( c4 |
      \grace { d16( ef } f8) d ef c d bf\) |
    }
    \\
    \relative {
      \slashedGrace g'8~ 2.\sf~ | 2.~ | 2.~ | 2. |
      \slashedGrace f8~ 2.\sf~ | 2.~ | 2.~ | 2. |
    }
  >>

  d2.~ |
  4 fs,8\( g a fs\) |
  d'2.~ |

  \voiceOne
  4~ 16\( d e fs g a bf c\) |
  \once \override TrillSpanner.bound-details.left.text = \markup {
    \musicglyph "scripts.trill" \raise #1.5 \teeny \flat \hspace #0.25
  }
  d2.~\startTrillSpan | 2.~ | 2.~ | 2.~ | 2.~ | 2. |

  \once \override TrillSpanner.bound-details.left.text = \markup {
    \musicglyph "scripts.trill" \raise #1.5 \teeny \flat \hspace #0.25
  }
  \once \override TrillSpanner.to-barline = ##f
  \once \override TrillSpanner.bound-details.right.padding = #-1
  d,~\startTrillSpan | 2.~ |

  \oneVoice
  \once \override TrillSpanner.bound-details.left.text = \markup {
    %%\musicglyph "scripts.trill"
    \raise #1.5 \teeny \natural \hspace #0.25
  }
  \once \override TrillSpanner.Y-offset = #5.5
  d~\startTrillSpan | 2.~ | 2.~ | 2. |

  \slashedGrace { \bar "" cs8(\stopTrillSpan \bar "||" }
}

turn_natural = \markup { \hspace #0.60 \column { \center-align \line { \musicglyph #"scripts.turn" } \line { \raise #1.75 \fontsize #-3 \natural } } }

lower.C = \relative {
  \barNumberCheck 45
  \repeat unfold 2 {
    g,4 <b' d g> q |
    c, <c' ef g> q |
  }
  \repeat unfold 2 {
    f,, <a' c f> q |
    bf, <bf' d f> q |
  }
  \repeat unfold 2 {
    g, <g' b f'> q |
    c, <g' c ef> q |
  }
  \repeat unfold 2 {
    f, <f' a ef'> q |
    bf, <f' bf d> q |
  }
  \barNumberCheck 61
  d, <fs' d'>\(
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  \once \override Hairpin.to-barline = ##f
  <a e'>\< |
  <d fs>\)\! r r |
  d,-\shape #'((0 . -1) (5.5 . 7) (-1.5 . -9) (-1 . -3.5)) -\(
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  \once \override Hairpin.to-barline = ##f
  <bf' g'>\< <d a'> |
  \change Staff = "up"
  \voiceTwo
  <g bf>\)\!
  \change Staff = "down"
  \oneVoice
  r r |

  d
  \change Staff = "up"
  \voiceTwo
  <fs d'>_\( <a e'> |
  <d fs>\) fs8\( g a fs\) |
  \change Staff = "down"
  \oneVoice
  d,4
  \change Staff = "up"
  \voiceTwo
  <bf' g'>\( <d a'> |
  <g bf>\) g8\( a bf g\) |
  <d fs>4 fs8\( g a fs\) |
  g4 g8\( a bf g\) |
  <d, fs>4 fs8\( g a fs\) |
  g4 g8\( a bf g\) |
  \once \showStaffSwitch
  \change Staff = "down"
  \oneVoice
  \repeat unfold 2 {
    d4 d cs^\turn_natural |
  }
  <<
    { s4 d2~ | 2. | } \\
    { d4 d4. cs8 | c4 b a | }
  >>
}

editorial.above.C = {
  \barNumberCheck 45
  s4-\markup \italic { con forza la melodia } s2 |
  s2. * 31 |
  \grace s8
  \barNumberCheck 77
}

editorial.between.C = {
  \barNumberCheck 45
  s4\p s2 |
  s2. |
  s2 s4\> |
  s8 s8\! s2 |
  s4\p s2 |
  s2. * 2 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
  s8\> s8 * 4 s8\! |
  \repeat unfold 2 {
    s2. * 3 |
    \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,LEFT)
    s8\> s8 * 4 s8\! |
  }
  s4\mf s2 | s2. * 2 |
  s4 s16 s16\< s16*5 s16\! |
  s2 s4\cresc |
  s2. * 4 |
  s4 s4\! s4 |
  s2. * 2 |
  s4\f s2 |
  \once \override Hairpin.endpoint-alignments = #`(,LEFT . ,RIGHT)
  s4\> s2 |
  s4 s8 s8 s8\! s8-\markup \whiteout \pad-markup #0.5 \italic { poco ritardando } |
  s2. |
  \barNumberCheck 77
}

editorial.below.C = {
  \barNumberCheck 45
  \repeat unfold 4 {
    s4\sustainOn s2 |
    s4\sustainOff\sustainOn s8 s8\sustainOff s4 |
    s4\sustainOn s2 |
    s4\sustainOff\sustainOn s4\sustainOff s4 |
  }
  s4\sustainOn s2 |
  s4 s4\sustainOff s4 |
  s4\sustainOn s2 |
  s8 s8\sustainOff s2 |
  s4\sustainOn s2 |
  s4\sustainOff s2 |
  s4\sustainOn s2 |
  s4\sustainOff s2 |
  s2. * 8 |
  \barNumberCheck 77
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A′ = mm. 77 - 92

upper.A′ = \relative {
  d''4) d c\turn |
  b b c\turn |
  d d c\turn |
  b b c\turn |
  d2\( \grace { e16( fs } g4)\) |
  d2\( \grace { e16( fs } g4)\) |
  d2.~ |
  4 d4.->( cs8) |

  \refrain.upper

  <b, e g b>4 <e g b e> <cs g' a cs> |
  <d fs a d>2 d4 |
}

lower.A′ = \relative {
  <<
    {
      d'2.~ | 2. |
      2.~ | 2. |
    }
    \\
    {
      b4 b a | g g a | b b a | g g a |
    }
  >>
  <b d>4\(\< g'\! <c, e>\) |
  <b d>\(\< g'\! <c, e>\) |
  <b d>\(\< g'4.\! e8 |
  d2.\) |

  \refrain.lower

  <e, g>4 <e, b' g'>\arpeggio <a e' a> |
  <d a'> d, r |
}

editorial.above.A′ = {
  \barNumberCheck 77
  s4-\markup \italic { a tempo } s2 |
  s2. * 7 |
  \refrain.above
  s2. * 2  |
  \barNumberCheck 93
}

editorial.between.A′ = {
  \barNumberCheck 77
  s4\p s2 |
  s2. * 5 |
  s4-\markup \italic { rit. }
  \once \override Hairpin.endpoint-alignments = #`(,RIGHT . ,CENTER)
  \once \override Hairpin.to-barline = ##f
  s4\> s4 |
  s4\! s4 s4 |
  \refrain.between
  s2. * 2 |
  \barNumberCheck 93
}

editorial.below.A′ = {
  \barNumberCheck 77
  s2. * 4 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s4 s4.\sustainOn s8\sustainOff |
  s4 s4.\sustainOn s8\sustainOff |
  \refrain.below
  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff
  s16 s8\sustainOn s16\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  \barNumberCheck 93
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B′ = mm. 93 - 116
%%
%% Same as B except the ending, m. 116 with no repeat replacing the
%% 1st/2nd endings in mm. 43-44.

upper.B′ = \relative {
  \barNumberCheck 93
  \Bcore.upper
  <b d g>4 r r |
  \barNumberCheck 117
}

lower.B′ = \relative {
  \barNumberCheck 93
  \Bcore.lower
  <g, d' g>4 r d'' |
  \barNumberCheck 117
}

editorial.above.B′ = {
  \barNumberCheck 93
  \Bcore.above
  s2. |
  \barNumberCheck 117
}

editorial.between.B′ = {
  \barNumberCheck 93
  \Bcore.between
  s2. |
  \barNumberCheck 117
}

editorial.below.B′ = {
  \barNumberCheck 93
  \Bcore.below
  s4\sustainOn s4 s4\sustainOff |
  \barNumberCheck 117
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Coda mm. 117-138

tr = \startTrillSpan

upper.Coda = \relative {
  d''2\tr c4\tr |
  b2\tr c4\tr |
  d2\tr c4\tr |
  b2\tr c4\tr |

  \omit TupletNumber
  \once \undo \omit TupletNumber
  \tuplet 3/2 4 {
    d8\stopTrillSpan\( cs d e d e fs e fs |
    g fs g a g a b a b |
    c as b c b c cs bs cs |
    d cs d cs d cs
  }
  d16 cs d cs\) |

  \ottava 1
  \tuplet 3/2 4 {
    d8\( cs d e d e fs e fs |
    g fs g a g a b a b |
    c e d c b a g fs e |
    \ottava 0
    d c b a g fs e fs e\) |
    d\( cs d e d e fs e fs |
    g fs g a g a b a b |
    c e d c b a g fs e |
    d c b a g fs
  }
  e16 d e fs\) |

  \tuplet 3/2 4 { g8^\( b a g fs e } d16 c b a |

  \change Staff = "down"
  \voiceOne

  \tuplet 3/2 4 { g8 b a g fs e } d16 c b a\) |

  r16 g[\( b d g b d
  \change Staff = "up"
  g b d g b] |
  d g b d
  \ottava 1
  g8\)
  \ottava 0
  r r4 |

  \oneVoice
  \resetRelativeOctave c'
  \set PianoStaff.connectArpeggios = ##t
  <d g b d b'>4\arpeggio ^\markup \italic \small { L.H. } r r |
  <g b d g> r r |
}

lower.Coda = \relative {
  <b d>2 <a d>4 |
  <g d'>2 <a d>4 |
  <b d> q <a d> |
  <g d'>2 <a d>4 |
  <b d> c d |
  e fs g |
  a2 as4 |
  b2. |
  \clef treble
  <b d>4-. <as cs>-. <a c>-. |
  <g b>-. <fs a>-. <e g>-. |
  <a, e' g c>\arpeggio r r |
  \clef bass
  <d fs> r r|
  <b d>-. <as cs>-. <a c>-. |
  <g b>-. <fs a>-. <e g>-. |
  <a, e' g c>\arpeggio r r |
  <d fs> r r |
  <g, d' b'>\arpeggio r r |
  <<
    {
      %% This pedal bracket wants to collide with the notes, I
      %% couldn't figure out how to move it down in the "below"
      %% dynamics context, so this fixed it.
      s2. |
      \once \hideNotes
      \grace \absolute fs,, \sustainOn
      s2. |
      s4 s8\sustainOff s8 s4 |
    }
    \\
    {
      \voiceTwo R2. |
      g,16[ b d g b d g b
      \change Staff = "up"
      d g b d] |
      g b d g b8 r r4 |
      \change Staff = "down"
    }
  >>
  \oneVoice
  \resetRelativeOctave c
  <g d' b'>4\arpeggio r r |
  \once \override Stem.details.lengths = #'(6)
  \slashedGrace g,8( <d'' g b d>4) r r |
}

editorial.above.Coda = {
  \mark "Coda"
  \tempo "Vivo"
  s2. |
}

editorial.between.Coda = {
  s2\p s4 |
  s2. * 3 |
  s4 s4\< s4 |
  \tuplet 3/2 4 { s8 * 8 s8\! } |
  s4 s4\< s4 |
  s4 \tuplet 3/2 4 { s8 s8 s8\! } s4 |
  \tuplet 3/2 4 {
    s8 s8 s8-\markup \italic { accelerando } s4. s8\< s4 |
    s4. s8 s8 s8\! s4. |
    s4 s8\> s4. s4. |
    s4. s4. s8 s8 s8\! |
    s4.\< s4. s4. s4. s8 s8\! s8 s4. |
    s8\f s8\> s8 s4. s4. |
    s4. s4.
  }
  s16\! s16 * 3 |
  s2. * 3 |
  s16\> s16 * 3 s8\! s8 s4\mf |
  s2. |
  \grace s8\p
  s2. |
}

editorial.below.Coda = {
  s2. * 10 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s2. * 2 |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s4\sustainOn s4 s4\sustainOff |
  s2. |
  % \grace s8\sustainOn
  % s4 s4 s4 |
  % s4 s8\sustainOff s8 s4 |
  s2. | s2. |
  s4\sustainOn s4\sustainOff s4 |
  \grace s8\sustainOn s4 s4\sustainOff s4 |
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
  s2. * 4 | \break
  \barNumberCheck 49
  s2. * 4 | \break
  \barNumberCheck 53
  \grace s8
  s2. * 4 | \break
  \barNumberCheck 57
  \grace s8
  s2. * 4 | \break
  \barNumberCheck 61
  s2. * 4 | \pageBreak
  \barNumberCheck 65
  s2. * 6 | \break
  \barNumberCheck 71
  s2. * 6 |
  \grace s8
  \break
  \barNumberCheck 77
  s2. * 6 | \break
  \barNumberCheck 83
  s2. * 5 | \break
  \barNumberCheck 88
  s2. * 5 | \pageBreak
  \barNumberCheck 93
  s2. * 5 | \break
  \barNumberCheck 98
  s2. * 5 | \break
  \barNumberCheck 103
  s2. * 4 | \break
  \barNumberCheck 107
  s2. * 4 | \break
  \barNumberCheck 111
  s2. * 6 | \pageBreak
  \barNumberCheck 117
  s2. * 6 | \break
  \barNumberCheck 123
  s2. * 3 | \break
  \barNumberCheck 126
  s2. * 4 | \break
  \barNumberCheck 130
  s2. * 4 | \break
  \barNumberCheck 134
}

\score {
  \new PianoStaff <<
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }{
      \global
      \editorial.above.A
      \editorial.above.B
      \editorial.above.C
      \editorial.above.A′
      \editorial.above.B′
      \editorial.above.Coda
    }
    \new Staff = "up" {
      \global
      \upper.A
      \bar "||"
      \upper.B
      \bar "||"
      \upper.C
      \bar "||"
      \upper.A′
      \bar "||"
      \upper.B′
      \bar "||"
      \upper.Coda
      \bar "|."
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #CENTER
    }{
      \global
      \editorial.between.A
      \editorial.between.B
      \editorial.between.C
      \editorial.between.A′
      \editorial.between.B′
      \editorial.between.Coda
    }
    \new Staff = "down" {
      \global
      \lower.A
      \lower.B
      \lower.C
      \lower.A′
      \lower.B′
      \lower.Coda
    }
    \new Dynamics \with {
      \override VerticalAxisGroup.staff-affinity = #UP
    }{
      \global
      \editorial.below.A
      \editorial.below.B
      \editorial.below.C
      \editorial.below.A′
      \editorial.below.B′
      \editorial.below.Coda
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
