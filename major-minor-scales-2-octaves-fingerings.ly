\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
}

\layout {
}

\header {
  title = "Major and Minor Scales"
  subtitle = "Two octaves, with fingerings"
  tagline = ##f
}

rflat = \markup { \raise #0.5 \tiny \flat }
rsharp = \markup { \raise #1 \tiny \sharp }
threes = \markup \concat { "(" \tiny \number 3 ")" }
thumbs = \markup \concat { "(" \tiny \number 1 ")" }

\new Staff \with { \omit TimeSignature } {
  \clef treble
  \key c \major
  \time 4/4
  \relative c' {
    c8^\markup { "C major" \threes }^1_5
    d e^3 f^1 g_1 a_3 b^4 c^1_1 |
    d_4 e^3 f^1 g_1 a_3 b c^5_1 b |
    a_3 g_1 f^1 e^3 d_4 c^1_1 b^4 a_3 |
    g_1 f^1 e^3 d c4^1_5 r | \break
    a8^\markup { "A natural minor" \threes }^1_5
    b c^3 d^1 e_1 f_3 g^4 a^1_1 |
    b_4 c^3 d^1 e_1 f_3 g a^5_1 g |
    f_3 e_1 d^1 c^3 b_4 a^1_1 g^4 f_3 |
    e_1 d^1 c^3 b a4^1_5 r | \break
    a8^\markup { "A harmonic minor" \threes }^1_5
    b c^3 d^1 e_1 f_3 gs^4 a^1_1 |
    b_4 c^3 d^1 e_1 f_3 gs a^5_1 gs |
    f_3 e_1 d^1 c^3 b_4 a^1_1 gs^4 f_3 |
    e_1 d^1 c^3 b a4^1_5 r | \break
    a8^\markup { "A melodic minor" \threes }^1_5
    b c^3 d^1 e_1 fs_3 gs^4 a^1_1 |
    b_4 c^3 d^1 e_1 fs_3 gs a^5_1 g |
    f_3 e_1 d^1 c^3 b_4 a^1_1 g^4 f_3 |
    e_1 d^1 c^3 b a4^1_5 r | \break
  }
}
