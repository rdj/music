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
  title = "Title"
  subsubtitle = \markup { "From" \italic "Whatever" "(Year)" }
  composer = "Composer"
  opus = "Catalog 123 (Year)"
  tagline = ##f
}

global = {
  \key c \major
  \time 4/4
}

upperStaff = {
  \tempo "Tempo"
  \relative c'' {
    \repeat unfold 20 R1
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    \repeat unfold 20 R1
  }
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
