\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  indent = 0
}

\header {
  title = "Skylords - The Churning Mists (Night)"
  composer = "Masayoshi Soken"
  tagline = "Transcribed by Matthew Carlton"
}


poco_rit = {
  \override TextSpanner.bound-details.left.text = \markup { \italic "poco rit." }
  \textSpannerDown
}

\new PianoStaff <<
  \new Staff = "upper" \with {
    % Clearing beamException will cause 3/4 measures to be beamed as
    % three groups of two instead of one group of six.
    beamExceptions = #'()
  }
  {
    \clef treble
    \key d \major
    \tempo "Calmly, but with movement" 4 = 82
    \time 3/4
    
    \relative c'' {
      fs8^\markup{ \italic legato } \p a d cs a b |
      \repeat unfold 14 { fs a d cs a b | }
      \poco_rit
      fs a\startTextSpan d cs a b\stopTextSpan |
      <<
        \relative c''' {
          r4 \p a4\(^\markup { \italic catabile } fs( |
          fs2) d8 e |
          fs4 b,2( |
          b2.)\) |
        }
        \\
        \relative c'' {
          <a d,>2._\markup { \italic "a tempo" }
        }
      >>
    }
  }

  \new Staff = "lower" \with {
    beamExceptions = #'()
  }
  {
    \clef treble
    \key d \major
    \time 3/4
    \relative c' {
      <b fs'>2._\markup{ \italic { with plenty of pedal throughout } } |
      b' |
      <a d,> |
      d2 cs,4 |
      <b fs'>2. |
      d'2 b,8 cs |
      <d a'>2. |
      cs'2 cs,4 |
      \clef bass
      <<
        \relative c' {
          <b, fs'>2. |
          s2. |
          s2 r8 a'8\( |
          d,2 cs4 |
          <b fs'>2.\) |
          s2. |
          s2 r8 a'8 |
          d,2 cs4 |
          \stemDown b2. |
        }

        \new Voice {
          \voiceTwo
          \relative c' {
            c4.\rest a8\( fs' e |
            fs2 a8 b |
            <fs cs d,>2.\) |
            s2. |
            c4.\rest a8\( fs' e |
            fs2 a8 b |
            <fs cs d,>2.\) |
            s2. |
            \stemUp
            fs,8 a d cs a b |
          }
        }
      >>
    }
  }
>>
