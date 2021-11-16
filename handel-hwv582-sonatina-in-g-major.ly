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
  title = "Sonatina in G major"
  composer = "George Frideric Handel"
  opus = "HWV 582 (ca. 1721-1722)"
  tagline = ##f
}

global = {
  \key g \major
  \time 4/4
}

upperStaff = {
  \relative c'' {
    g4. b8 a[ d,] d'[ c] |
    b g g'2 fs4 |
    g8[ d] e[ b] cs[ a] d[ fs,] |
    g b a g fs a d4~ | \break
    4 c2 b4 |
    a2 g4 g'~ |
    4 f2 e4 |
    d2 c4. e8 |
    d[ g,] g'[ f] e[ d] c4~ | \break
    4 b a d~ |
    4 c b4. e8 |
    cs a d2 cs4 |
    d a8 b c e d c |
    b d g fs e d c b | \break
    a4 d2 c4~ |
    4 b a2 |
    g4 g'8 fs e d c b |
    a fs' g b, a4.\trill g8 |
    g1 |
  }
  \bar "|."
}

lowerStaff = {
  \relative c {
    g4 g'2 fs4 |
    g4. b8 a[ d,] d'[ c] |
    b4 g2 fs8 b |
    e,4 cs' d4. d,8 |
    e d e fs g d g b, |
    c a d c b g r e' |
    a g a b c g a e |
    f d g g, c4 c'~ |
    4 b c r8 e, |
    fs d g2 fs8 b |
    gs e a2 g4~ |
    4 fs e8 fs16 g a8 g |
    fs d fs g a4 fs |
    g b c8 b a g |
    fs e fs d e d e fs |
    g d e b c a d c |
    b a g4 c8 b a4 |
    d8 c b c d4 d, |
    g1 |
  }
}

dynamics = {
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
    \new Dynamics {
      \global
      \dynamics
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
