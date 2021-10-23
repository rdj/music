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
  title = "Major Scales, Two Octaves, With Fingerings"
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
  \repeat volta 2 \relative c' {
    c8^\markup { "C Major" \threes }^1_5
    d e^3 f^1 g_1 a_3 b^4 c^1_1 |
    d_4 e^3 f^1 g_1 a_3 b c^5_1 b |
    a_3 g_1 f^1 e^3 d_4 c^1_1 b^4 a_3 |
    g_1 f^1 e^3 d c4^1_5 <bf d e a> |
    \key f \major 
    \break
    f'8^\markup { "F Major" \thumbs }^1_5
    g a bf^4 c^1_1 d_3 e^3 f^1_1 |
    g_4 a bf^4 c^1_1 d_3 e f^4_1 e |
    d_3 c^1_1 bf^4 a g_4 f^1_1 e^3 d_3 |
    c^1_1 bf^4 a g f4^1_5 <ef g a d> |
    \break
    \key bf \major
    bf8^\markup { \concat { "B" \rflat " Major" } }^2_3
    c^1 d_1 ef^3_4 f^1 g a_1 bf^4_3 |
    c^1 d_1 ef^3_4 f^1 g a_1 bf^4_3 a_1 |
    g f^1 ef^3_4 d_1 c bf^4_3 a_1 g |
    f^1 ef^3_4 d_1 c bf4^2_3 <af c d g> |
    \break
    \key ef \major
    ef'8^\markup { \concat { "E" \rflat " Major" } }^3_3
    f^1 g_1 af_4 bf^4 c^1 d_1 ef^3_3 |
    f^1 g_1 af_4 bf^4 c^1 d_1 ef^3_3 d_1 |
    c^1 bf^4 af_4 g_1 f^1 ef^3_3 d_1 c^1 |
    bf^4 af_4 g_1 f^1 ef4^3_3 <df f g c> |
    \break
    \key af \major
    af8^\markup { \concat { "A" \rflat " Major" } }^3_3
    bf^4 c^1_1 df_4 ef^3 f^1 g_1 af_3 |
    bf^4 c^1_1 df_4 ef^3 f^1 g_1 af^3_3 g_1 |
    f^1 ef^3 df_4 c^1_1 bf^4 af_3 g_1 f^1 |
    ef^3 df_4 c^1_1 bf^4 af4^3_3 <gf bf c f> |
    \break
    \key df \major
    df'8^\markup { \concat { "D" \rflat " Major" } \thumbs }^2_3
    ef^3 f^1_1 gf_4 af bf^4 c^1_1 df_3 |
    ef^3 f^1_1 gf_4 af bf^4 c^1_1 df^2_3 c^1_1 |
    bf^4 af gf_4 f^1_1 ef^3 df_3 c^1_1 bf^4 |
    af gf_4 f^1_1 ef^3 df4^2_3 <b ds es as> |
    \break
    \key fs \major
    fs'8^\markup { \concat { "F" \rsharp " Major" } \thumbs }^2_4
    gs as^4 b^1_1 cs_3 ds^3 es^1_1 fs_4 |
    gs as^4 b^1_1 cs_3 ds^3 es^1_1 fs^2_2 es^1_1 |
    ds^3 cs_3 b^1_1 as^4 gs fs_4 es^1_1 ds^3 |
    cs_3 b^1_1 as^4 gs fs4^2_4 <e gs as ds> |
    \break
    \key b \major
    b8^\markup { "B Major" \thumbs }^1_4
    cs ds^3 e^1_1 fs_4 gs as^4 b^1_1 |
    cs_3 ds^3 e^1_1 fs_4 gs as b^5_1 as |
    gs fs_4 e^1_1 ds^3 cs_3 b^1_1 as^4 gs |
    fs_4 e^1_1 ds^3 cs b4^1_4 <a cs ds gs> |
    \break
    \key e \major
    e'8^\markup { "E Major" \threes }^1_5
    fs gs^3 a^1 b_1 cs_3 ds^4 e^1_1 |
    fs_4 gs^3 a^1 b_1 cs_3 ds e^5_1 ds |
    cs_3 b_1 a^1 gs^3 fs_4 e^1_1 ds^4 cs_3 |
    b_1 a^1 gs^3 fs e4^1_5 <d fs gs cs> |
    \break
    \key a \major
    a8^\markup { "A Major" \threes }^1_5
    b cs^3 d^1 e_1 fs_3 gs^4 a^1_1 |
    b_4 cs^3 d^1 e_1 fs_3 gs a^5_1 gs |
    fs_3 e_1 d^1 cs^3 b_4 a^1_1 gs^4 fs_3 |
    e_1 d^1 cs^3 b a4^1_5 <g b cs fs> |
    \break
    \key d \major
    d'8^\markup { "D Major" \threes }^1_5
    e fs^3 g^1 a_1 b_3 cs^4 d^1_1 |
    e_4 fs^3 g^1 a_1 b_3 cs d^5_1 cs |
    b_3 a_1 g^1 fs^3 e_4 d^1_1 cs^4 b_3 |
    a_1 g^1 fs^3 e d4^1_5 <c e fs b> |
    \break
    \key g \major
    g8^\markup { "G Major" \threes }^1_5
    a b^3 c^1 d_1 e_3 fs^4 g^1_1 |
    a_4 b^3 c^1 d_1 e_3 fs g^5_1 fs |
    e_3 d_1 c^1 b^3 a_4 g^1_1 fs^4 e_3 |
    d_1 c^1 b^3 a g4^1_5 <f a b e> |
  }
}
