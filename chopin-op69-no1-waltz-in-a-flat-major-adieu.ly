\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Valse (“L'adieu”)"
  subsubtitle = \markup { "from" \italic "2 Valses des oeuvres posthumes" "(1855)" }
  composer = "Frédéric Chopin"
  opus = "Op. posth. 69, No. 1 (1835)"
  tagline = ##f
}

global = {
  \key af \major
  \time 3/4
  \tempo "Lento" 4 = 138
  \partial 4
  \override TupletBracket.bracket-visibility = ##t
}

upper.A = \relative {
  \clef treble
  ef''8( d |
  \tuplet 3/2 { df ef df } c df f ef |
  df2 c4) |
  r4 a8( bf \tuplet 3/2 { c ef df } |
  c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  r4
  \slashedGrace ef8^( g')( f ef df |
  b2 c4~) |
  8( df bf' af f df |
  df2 c4) |
  \tuplet 5/4 { a16( bf a gs a } \tuplet 3/2 { c8 ef f } gf8.) a,16( |
  \acciaccatura a8 c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  \tuplet 3/2 { ef8( f ef } d ef <f df'> <g c> |
  af4) r ef'8( d |
  \tuplet 3/2 { df ef df } c df f ef |
  df2 c4) |
  r4 a8( bf c \acciaccatura ef df |
  c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  r4
  \slashedGrace ef8^( g')( f ef df |
  b2 c4~) |
  8( df bf' af f df |
  df2 c4) |
  \tiny
  \tuplet 13/4 { a8( bf a gs a bf b c df d ef e f }
  \normalsize
  gf8)[-! r16 a,16]( |
  \acciaccatura a8 c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  \tuplet 3/2 { ef8( f ef } d ef <f df'> <g c> |
  af4) r ef'8( d) |
}

lower.A_tenor = \relative {
  s4 |
  r4 <af df> q |
  r <g c> q |
  r <gf c> q |
  r <f bf> q |
  r <f bf> <f b> |
  r <af c> q |
  s2.*2 |
  r4 <af df> q |
  r <g df'> <g c> |
  r <gf c> q |
  r <f c'> <f bf> |
  r <f bf> <f b> |
  s2.*3 |
  r4 <af df> q |
  r <g df'> <g c> |
  r <gf c> q |
  r <f c'> <f bf> |
  r <f bf> <f b> |
  r <af c> q |
  s2.*2 |
  r4 <af df> q |
  r <g df'> <g c> |
  r <gf c> q |
  r <f c'> <f bf> |
  r <f bf> <f b> |
  s2.*3 |
}

lower.A_bass = \relative {
  \oneVoice
  r4 |
  \voiceTwo
  \repeat unfold 2 {
    f2. |
    e |
    ef |
    df |
    d |
    ef |
    \oneVoice
    ef,4 <ef' bf' df> <ef g df'> |
    af, <ef' af c> q |
    \voiceTwo
    f2. |
    e |
    ef |
    df |
    d |
    \oneVoice
    ef,4 <ef' af c> q |
    ef, <ef' g df'> <ef bf' df> |
    af, <ef' c'> r |
    \voiceTwo
  }
}

lower.A = {
  \clef bass
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.A_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.A_bass
    }
  >>
}

editorial.above.A = {
  %% marks above the grand staff
  s4 |

  \repeat unfold 2 {
    s2.*14 |
    s4 s2^\markup { \italic { riten. } } |
    s2.^\markup { \italic { a tempo } } |
  }
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s16\p s8._\markup { \italic { con espressione } } |
  s2. |
  s4\> s4 s4\! |
  s4 s4\< s4\! |
  s4\> s4 s4\! |
  s2._\markup { \italic { cresc. } } |
  s2\> s4\! |
  s2.\f |
  s4\> s4 s4\! |
  s4\p s2 |
  s4\> s4 s4\! |
  s4 \tuplet 3/2 { s8\< s8 s8\! } s8.\> s16\! |
  \acciaccatura s8
  s2\> s4\! |
  s2. |
  s2\> s4\! |
  s2.*2 |

  s2. |
  s4\> s4 s4\! |
  \barNumberCheck #19
  s4 s4\< s8 s8\! |
  s4\> s4 s4\! |
  s2._\markup { \italic { cresc. } } |
  s2\> s4\! |
  s2.\f |
  s4\> s4 s4\! |
  s4\p s2 |
  s4\> s4 s4\! |
  \tuplet 13/4 { s8\< s8 s8 s8 s8 s8 s8 s8 s8 s8 s8 s8 s8\! } s4 |
  \acciaccatura s8
  s2\> s4\! |
  s2. |
  s2\> s4\! |
  s2.*2 |

}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
  s4 |
  \repeat unfold 2 {
    \repeat unfold 15 {
      s4\sustainOn s4 s4\sustainOff |
    }
    s4\sustainOn s4\sustainOff s4 |
  }
}

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*5 | \break
  \barNumberCheck #6
  s2.*6 | \break
  \barNumberCheck #12
  \acciaccatura s8
  s2.*5 | \break
  \barNumberCheck #17
  s2.*5 | \break
  \barNumberCheck #22
  s2.*6 | \pageBreak
  \barNumberCheck #28
  \acciaccatura s8
  s2.*5 | \break
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \accidentalStyle piano
    \new Dynamics {
      \global
      \editorial.above.A
    }
    \new Staff = "up" {
      \global
      \upper.A
    }
    \new Dynamics {
      \global
      \editorial.between.A
    }
    \new Staff = "down" {
      \global
      \lower.A
      \bar "|."
    }
    \new Dynamics {
      \global
      \editorial.below.A
    }
    \new Dynamics {
      \global
      \breaks_ref
    }
  >>
}
