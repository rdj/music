\version "2.24.4"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
  % indent = 0
  % page-breaking = #ly:one-page-breaking
}

\header {
  title = \markup { "Invention in E minor" }
  subsubtitle = \markup { "No. 7 from" \italic { "15 Inventions" } "(1801)" }
  composer = "Johann Sebastian Bach"
  opus = "BWV 778 (1723)"
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
  \key e \minor
  \time 4/4
  \autoLineBreaksOff
}

upperStaff = \relative c'' {
  %% Bach: \clef soprano
  r8 b16 a g fs g e b'8\mordent b e8.-\mordent fs16 |
  ds8\prall fs16 e ds cs ds b b'8 a16 g fs8.\prall e32 fs |
  g8 b16 a g fs g e c'8. b16 a g fs e |
  fs8 a16 g fs e fs d b'8. a16 g fs e d |
  e fs e d c b a g c b a b c d e fs |
  g fs e d g8.\mordent g16 g fs e fs fs8.\prall g16 |
  g8 d16 c b a b g d'2~ \prallprall | 1~ |
  8. e16 cs8.\prall d16 d8 a16 g fs e fs d |
  c'8.\mordent b16 c8. d16 b8\prall b e8.\mordent e16 |

  e g fs e d cs d b as8 fs'16 e d cs d b |
  e8 b'16 a g fs g e as8 cs, fs as, |
  b8. cs16 8. b16 8[ d] e,[ d'] |
  c[ a] d,[ c'] b[ d] g[ b,] |
  a[ fs'] g,[ e'] ds8\prall fs16 e ds cs b a |
  g fs g b e b a g fs e fs a d a g fs |
  e ds e g c g fs e ds cs ds fs b8 b |
  b4~ 16 ds e g a,4~ 16 cs ds fs |
  g,4~ 16 b ds e fs, a b c ds, fs g a |
  b,8 a'~ 16 fs b fs g8 e c'8.\mordent 16 |
  8\prall b g'8. 16 g a g fs fs8.\prall e16 |
  e d c b a g a fs ds'8 fs, b8. c16 |
  a8.\prall g16 fs8.\prall e16 e2\fermata
  \bar "|."
}

lowerStaff = \relative {
  e8\mordent e, r4 r8 b''16 a g fs g e |
  b'8 b, r4 r8 fs''16 e ds cs ds b |
  e8 e, r4 r8 e'16 d c b c a |
  d8 d, r4 r8 d'16 c b a b g |
  c8. b16 a g fs e a8. g16 fs e d c |
  b8. c16 b a g fs e8[ c'] d[ d,] |
  g4 r r8 g16 a b a b g |
  d' cs d e fs e fs d g fs g a b a b fs |
  g fs g e a8[ a,] d[ d,] r4 |
  r8 a''16 g fs e fs d g a g fs e d e cs |
  fs8[ as,] b[ g] fs4 r8 b'16 a |
  g fs g e d'8. e16 cs8 g'16 fs e d e cs |
  d cs d b fs'8 fs, b16 c b a gs fs gs e |
  a b a g fs e fs d g a g fs e d e cs |
  ds cs ds b e ds e e, b'2~ |
  1~ |
  2.~ 16 c'16 b a |
  g fs g b e b a g fs e fs a ds a g fs |
  e ds e g c g fs e ds8 b r4 |
  r16 g' fs e ds cs ds b e d c b a g a fs |
  g a g fs e d e c a' g a fs b a b g |
  c2~ 16 c' b a g fs g e ds8[ e] b'[ b,] e,2_\fermata
}

breaks = {
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \pageBreak

  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 2 | \break
  s1 * 3
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
