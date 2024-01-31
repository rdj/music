\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Title"
  subsubtitle = \markup { "From" \italic "Whatever" "(Year)" }
  composer = "Composer"
  opus = "Catalog 123 (Year)"
  tagline = ##f
}

\layout {
  \context {
    \PianoStaff
    \accidentalStyle piano
    printKeyCancellation = ##f
    %% \override TupletBracket.bracket-visibility = ##t
  }
}

global = {
  \key c \major
  \time 4/4
  \tempo "Tempo"
}

upper.A = \relative {
  \clef treble
  c'4 d e f g a b c~ 1
}

lower.A = \relative {
  \clef bass
  c1 g c
}

editorial.above.A = {
  %% marks above the grand staff
}

editorial.between.A = {
  %% marks between the staves, e.g. dynamics
}

editorial.below.A = {
  %% marks below the grand staff, e.g. pedal marks
}

breaks_ref = {
  %% breaks matching some reference for ease of authoring
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
      \upper.A
      \bar "|."
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
