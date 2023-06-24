\version "2.24"
\language "english"
\pointAndClickOff

\paper {
  indent = 0
  ragged-last = ##f
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \omit TimeSignature
    \accidentalStyle piano
  }
}

\header {
  title = "Major and Minor Scales"
  subtitle = "Two octaves, with fingerings"
  tagline = ##f
}

rflat = \markup { \raise #0.5 \tiny \flat }
rsharp = \markup { \raise #1 \tiny \sharp }
one = \markup \tiny \number 1
three = \markup \tiny \number 3
threes = \markup \parenthesize \three
thumbs = \markup \parenthesize \tiny \number 1

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

\pageBreak

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

\new Staff {
  \clef treble
  \key a \major
  \time 4/4
  \relative {
    a8^\markup { "A Major" \threes }^1_5
    b cs^3_3 d^1 e fs^3_3 gs a^1 |
    b_4 cs^3_3 d^1 e fs^3_3 gs a^5_1 gs |
    fs^3_3 e_1 d cs^3_3 b a_1 gs^4 fs^3_3 |
    e_1 d cs^3_3 b a4^1_5 r |
    \break
  }
  \relative {
    fs8^\markup { \concat{F \rsharp} Natural Minor \concat { ( \three } together on \concat { C \rsharp } only) }^3_4
    gs a^1 b cs_3^3 d^1 e fs_4 |
    gs a^1 b cs_3^3 d^1 e fs_2^3  e_1 |
    d cs^3_3 b_1 a gs^4 fs e_1 d |
    cs^3_3 b_1 a gs^4 fs4^3_4 r |
    \break
  }
  \relative {
    fs8^\markup { \concat{F \rsharp} Harmonic Minor \concat { ( \three } together on \concat { C \rsharp } only) }^3_4
    gs a^1 b cs_3^3 d^1 es fs_4 |
    gs a^1 b cs_3^3 d^1 es fs^3_2 es_1 |
    d cs^3_3 b_1 a gs^4 fs es_1 d |
    cs^3_3 b_1 a gs^4 fs4^3_4 r |
    \break
  }
  \relative {
    fs8^\markup { \concat{F \rsharp} Melodic Minor \concat { ( \three } ascending. RH changes descending; \three together on \concat { C \rsharp } only)}^2_4
    gs^3_3 a^1 b cs_3^3 ds es^1_1 fs_4 |
    gs^3_3 a^1 b cs_3^3 ds es^1_1 fs^3_2 e^2_1 |
    d cs^3_3 b_1 a gs^4 fs e_1 d |
    cs^3_3 b_1 a gs^3 fs4^2_4 r |
    \break
  }
}

\pageBreak

\new Staff {
  \clef treble
  \key e \major
  \time 4/4
  \relative {
    e'8^\markup { "E Major" \threes }^1_5
    fs gs^3_3 a^1 b cs^3_3 ds e^1 |
    fs_4 gs^3_3 a^1 b cs^3_3 ds e^5_1 ds |
    cs^3_3 b_1 a gs^3_3 fs e_1 ds^4 cs^3_3 |
    b_1 a gs^3_3 fs e4^1_5 r |
    \break
  }
  \relative {
    cs'8^\markup { \concat{C \rsharp} Natural Minor \threes}^3_3
    ds e^1 fs_4 gs^3_3 a^1 b cs^3_3 |
    ds e^1 fs_4 gs^3_3 a^1 b cs^3_3 b_1 |
    a gs^3_3 fs e_1 ds^4 cs^3_3 b_1 a |
    gs^3_3 fs e_1 ds^4 cs4^3_3 r |
    \break
  }
  \relative {
    cs'8^\markup { \concat{C \rsharp} Harmonic Minor \threes}^3_3
    ds e^1 fs_4 gs^3_3 a^1 bs cs^3_3 |
    ds e^1 fs_4 gs^3_3 a^1 bs cs^3_3 bs_1 |
    a gs^3_3 fs e_1 ds^4 cs^3_3 bs_1 a |
    gs^3_3 fs e_1 ds^4 cs4^3_3 r |
    \break
  }
  \relative {
    cs'8^\markup { \concat{C \rsharp} Melodic Minor \concat { ( \one } ascending; \three descending — RH changes)}^2_3
    ds e^1_1 fs_4 gs^3_3 as bs^1_1 cs_3 |
    ds e^1_1 fs_4 gs^3_3 as bs^1_1 cs^3_3 b_1 |
    a gs^3_3 fs e_1 ds^4 cs^3_3 b_1 a |
    gs^3_3 fs e_1 ds^4 cs4^3_3 r |
    \break
  }
}

\new Staff {
  \clef treble
  \key b \major
  \time 4/4
  \relative {
    b8^\markup{B Major \thumbs}^1_4
    cs ds e^1_1 fs_4 gs as b^1_1 |
    cs_3 ds e^1_1 fs_4 gs as b^5_1 as |
    gs fs e^1_1 ds^3 cs b^1_1 as^4 gs |
    fs e^1_1 ds^3 cs b4^1_4 r |
    \break
  }
  \relative {
    gs8^\markup{\concat{G \rsharp} Natural Minor \thumbs}^3_3
    as b^1_1 cs_3 ds e^1_1 fs_4 gs |
    as b^1_1 cs_3 ds e^1_1 fs_3 gs^3_2 fs |
    e^1_1 ds^3 cs b^1_1 as^4 gs fs e^1_1 |
    ds^3 cs b^1_1 as^4 gs4^3_3 r |
    \break
  }
  \relative {
    gs8^\markup{\concat{G \rsharp} Harmonic Minor \threes}^3_3
    as b^1 cs_4 ds^3_3 e^1 fss gs^3_3 |
    as b^1 cs_4 ds^3_3 e^1 fss gs^3_3 fss_1 |
    e ds^3_3 cs b_1 as^4 gs^3_3 fss_1 e |
    ds^3_3 cs b_1 as^4 gs4^3_3 r |
    \break
  }
  \relative {
    gs8^\markup{\concat{G \rsharp} Melodic Minor \concat{( \three} ascending; \one descending — LH changes)}^3_3
    as b^1 cs_4 ds^3_3 es^1 fss gs^3_3 |
    as b^1 cs_4 ds^3_3 es^1 fss gs^3_2 fs |
    e^1_1 ds^3 cs b^1_1 as^4 gs fs e^1_1 |
    ds^3 cs b^1_1 as^4 gs4^3_3 r |
    \break
  }
}

\pageBreak

\new Staff {
  \clef treble
  \key fs \major
  \time 4/4
  \relative {
    fs8^\markup{\concat{ F \rsharp} Major \thumbs}^2_4
    gs as b^1_1 cs_3 ds es^1_1 fs_4 |
    gs as b^1_1 cs_3 ds es^1_1 fs es^1_1 |
    ds^3 cs b^1_1 as^4 gs fs es^1_1 ds^3 |
    cs b^1_1 as^4 gs fs4 r |
    \break
  }
  \relative {
    ds'8^\markup{\concat{D \rsharp} Natural Minor \thumbs}^3_2
    es^1_1 fs_4 gs as b^1_1 cs_3 ds |
    es^1_1 fs_4 gs as b^1_1 cs_3 ds cs |
    b^1_1 as^4 gs fs es^1_1 ds^3 cs b^1_1 |
    as^4 gs fs es^1_1 ds4 r |
    \break
  }
  \relative {
    ds'8^\markup{\concat{D \rsharp} Harmonic Minor \thumbs}^3_2
    es^1_1 fs_4 gs as b^1_1 css_3 ds |
    es^1_1 fs_4 gs as b^1_1 css_3 ds css |
    b^1_1 as^4 gs fs es^1_1 ds^3 css b^1_1 |
    as^4 gs fs es^1_1 ds4 r |
    \break
  }
  \relative {
    ds'8^\markup{\concat{D \rsharp} Melodic Minor \thumbs}^3_2
    es^1_1 fs_4 gs as bs^1_1 css_3 ds |
    es^1_1 fs_4 gs as bs^1_1 css_3 ds cs |
    b^1_1 as^4 gs fs es^1_1 ds^3 cs b^1_1 |
    as^4 gs fs es^1_1 ds4 r |
    \break
  }
}

\new Staff {
  \clef treble
  \key cs \major
  \time 4/4
  \relative {
    cs'8^\markup{\concat{ C \rsharp} Major \thumbs}^2_3
    ds es^1_1 fs_4 gs as bs^1_1 cs_3 |
    ds es^1_1 fs_4 gs as bs^1_1 cs bs^1_1 |
    as^4 gs fs es^1_1 ds^3 cs bs^1_1 as^4 |
    gs fs es^1_1 ds^3 cs4 r |
    \break
  }
  \relative {
    as8^\markup{\concat{A \rsharp} Natural Minor \thumbs}_2
    bs^1_1 cs_3 ds es^1_1 fs_4 gs as |
    bs^1_1 cs_3 ds es^1_1 fs_4 gs as
    gs |
    fs es^1_1 ds^3 cs bs^1_1 as^4 gs fs |
    es^1_1 ds^3 cs bs^1_1 as4 r |
    \break
  }
  \relative {
    as8^\markup{\concat{A \rsharp} Harmonic Minor \thumbs}_2
    bs^1_1 cs_3 ds es^1_1 fs_4 gss as |
    bs^1_1 cs_3 ds es^1_1 fs_4 gss as gss |
    fs es^1_1 ds^3 cs bs^1_1 as^4 gss fs |
    es^1_1 ds^3 cs bs^1_1 as4 r |
    \break
  }
  \relative {
    as8^\markup{\concat{A \rsharp} Melodic Minor \thumbs}_2
    bs^1_1 cs_3 ds es^1_1 fss_4 gss as |
    bs^1_1 cs_3 ds es^1_1 fss_4 gss as
    gs |
    fs es^1_1 ds^3 cs bs^1_1 as^4 gs fs |
    es^1_1 ds^3 cs bs^1_1 as4 r |
    \break
  }
}
