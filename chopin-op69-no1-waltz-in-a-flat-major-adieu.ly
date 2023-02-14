\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Waltz (“L’adieu”)"
  subsubtitle = \markup { from the autograph dedicated to Elise Peruzzi (1837) }
  composer = "Frédéric Chopin"
  opus = "WN 47 (1835) [Op. posth. 69, No. 1]"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
  }
}

global = {
  \key af \major
  \time 3/4
  \tempo "Tempo de Valse"
  \partial 4
}

upper.A = \relative {
  \clef treble
  ef''8( d |
  \tuplet 3/2 { df ef df } c[ df f8. ef16] |
  df2 c4) |
  r4
  <<
    { a8( bf \tuplet 3/2 { c ef df } }

      \new Staff \with {
        \remove Time_signature_engraver
        alignAboveContext = "up"
        \magnifyStaff #2/3
        firstClef = ##f
        \override KeySignature.stencil = ##f
      }
      {
        \key af \major
        a8( bf c \slashedGrace ef df)
        \once \override Staff.BarLine.transparent = ##t
        \once \override Staff.BarLine.allow-span-bar = ##f
      }
  >> |
  c2 bf4) |
  bf4.(-> af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  \barNumberCheck #7
  ef\( \grace { ef8[ f ef d ef] }
  \once \slurUp
  \acciaccatura ef8 g' f ef df |
  b2 c4~\) |
  8( df bf') af( f df |
  df2 c4) |
  r8
  \once \omit TupletNumber
  \tiny
  \tuplet 13/3 { a8(-> bf a gs a bf b c df d ef e f }
  \normalsize
  gf-.[) r16 a,16]( |
  \slashedGrace a8 c2 bf4) |
  bf4.( af8 \tuplet 3/2 { af g f } |
  f2 ef4) |
  \slashedGrace ef8
  \tuplet 3/2 { ef8( f ef } d ef <f df'> <g c> |
  af2)
}

lower.A_tenor = \relative {
  s4 |
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
  s2.*2 |
  s2
}

lower.A_bass = \relative {
  \oneVoice
  r4 |
  \voiceTwo
  f2. |
  e |
  ef |
  df |
  d |
  \oneVoice
  ef,4 <ef' af c> q |
  ef,4 <ef' g df'> q |
  af, <ef' af c> <e af c> |
  \voiceTwo
  f2. |
  e |
  ef |
  df |
  d |
  \oneVoice
  ef,4 <ef' af c> q |
  ef, <ef' g df'!> <ef bf' df> |
  af,( <ef' c'>)
  \voiceTwo
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
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
  s4-\tweak thickness #3.5
    _\markup \whiteout \italic "con anima"
  |
  s4
  \once \override Hairpin.shorten-pair = #'(0 . -2)
  s4\< s4 |
  s2\> s4\! |
  s2.*3 |
  s8..\> s32\! s4 s4 |
  s2.*3 |
  s8..\> s32\! s4 s4 |
}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
  s4 |
  s2.*5 |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s8 s8\sustainOff s4 |
  s2.*5 |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s4 s8 s8\sustainOff |
  s4\sustainOn s8_\markup { \italic Fine } s8\sustainOff
}

breaks_ref = {
  %% breaks matching some reference for ease of authoring
  s4 |
  s2.*4 | \break
  \barNumberCheck #5
  s2.*6 | \break
  \barNumberCheck #11
  s2.*6 | \break
  \barNumberCheck #17
}

%%showLastLength =   % use this to only render the last few measures
\score {
  \new PianoStaff <<
    \new Dynamics {
      \global
      \editorial.above.A
    }
    \new Staff = "up" {
      \global
      \repeat volta 2 {
        \upper.A
      }
    }
    \new Dynamics {
      \global
      \editorial.between.A
    }
    \new Staff = "down" {
      \global
      \lower.A
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
