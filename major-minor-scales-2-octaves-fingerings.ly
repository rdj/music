\version "2.20.0"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  page-breaking = #ly:one-page-breaking
  ragged-last = ##f
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \omit TimeSignature
  }
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

\new Staff {
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

\new Staff {
  \clef treble
  \key g \major
  \time 4/4
  \relative c' {
    \key g \major
    g8^\markup { "G Major" \threes }^1_5
    a b^3 c^1 d_1 e_3 fs^4 g^1_1 |
    a_4 b^3 c^1 d_1 e_3 fs g^5_1 fs |
    e_3 d_1 c^1 b^3 a_4 g^1_1 fs^4 e_3 |
    d_1 c^1 b^3 a g4^1_5 r | \break
    e'8^\markup { "E natural minor" \threes }^1_5
    fs g^3 a^1 b_1 c_3 d^4 e^1_1 |
    fs_4 g^3 a^1 b_1 c_3 d e^5_1 d |
    c_3 b_1 a^1 g^3 fs_4 e^1_1 d^4 c_3 |
    b_1 a^1 g^3 gs e4^1_5 r | \break
    e8^\markup { "E harmonic minor" \threes }^1_5
    fs g^3 a^1 b_1 c_3 ds^4 e^1_1 |
    fs_4 g^3 a^1 b_1 c_3 ds e^5_1 ds |
    c_3 b_1 a^1 g^3 fs_4 e^1_1 ds^4 c_3 |
    b_1 a^1 g^3 gs e4^1_5 r | \break
    e8^\markup { "E melodic minor" \threes }^1_5
    fs g^3 a^1 b_1 cs_3 ds^4 e^1_1 |
    fs_4 g^3 a^1 b_1 cs_3 ds e^5_1 d |
    c_3 b_1 a^1 g^3 fs_4 e^1_1 d^4 c_3 |
    b_1 a^1 g^3 gs e4^1_5 r | \break
  }
}

\new Staff {
  \clef treble
  \key d \major
  \time 4/4
  \relative c' {
    d8^\markup { "D Major" \threes }^1_5
    e fs^3 g^1 a_1 b_3 cs^4 d^1_1 |
    e_4 fs^3 g^1 a_1 b_3 cs d^5_1 cs |
    b_3 a_1 g^1 fs^3 e_4 d^1_1 cs^4 b_3 |
    a_1 g^1 fs^3 e d4^1_5 r | \break
    b8^\markup { "B natural minor" \thumbs }^1_4
    cs d^3 e^1_1 fs_4 g a^4 b^1_1 |
    cs_3 d^3 e^1_1 fs_4 g a b^5_1 a |
    g fs_4 e^1_1 d^3 cs_3 b^1_1 a^4 g |
    fs_4 e^1_1 d^3 cs b4^1_4 r | \break
    b8^\markup { "B harmonic minor" \thumbs }^1_4
    cs d^3 e^1_1 fs_4 g as^4 b^1_1 |
    cs_3 d^3 e^1_1 fs_4 g as b^5_1 as |
    g fs_4 e^1_1 d^3 cs_3 b^1_1 as^4 g |
    fs_4 e^1_1 d^3 cs b4^1_4 r | \break
    b8^\markup { "B melodic minor" \thumbs }^1_4
    cs d^3 e^1_1 fs_4 gs as^4 b^1_1 |
    cs_3 d^3 e^1_1 fs_4 gs as b^5_1 a |
    g fs_4 e^1_1 d^3 cs_3 b^1_1 a^4 g |
    fs_4 e^1_1 d^3 cs b4^1_4 r | \break
  }
}
