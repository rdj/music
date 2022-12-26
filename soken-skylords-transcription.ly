\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  print-page-number = ##f
  indent = 0
}

\header {
  title = "Skylords - The Churning Mists (Night)"
  subtitle = \markup { from \italic { Final Fantasy XIV: Heavensward } }

  composer = "Masayoshi Soken"
  poet = "(trans. Matthew Carlton)"
  tagline = ##f
}

poco_rit = {
  \override TextSpanner.bound-details.left.text = \markup { \italic "poco rit." }
  \textSpannerDown
}

global = {
  \key d \major
  \time 3/4
  \set Timing.beamExceptions = #'() % Beam each beat separately in 3/4 instead of the whole measure
  \tempo "Calmly, but with movement" 4 = 82
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-8

upper.A = \relative {
  fs''8 a d cs a b |
  \repeat unfold 7 { fs a d cs a b | }
}

lower.A = \relative {
  <b fs'>2.
  b' |
  <a d,> |
  d2 cs,4 |
  <b fs'>2. |
  d'2 b,8 cs |
  <d a'>2. |
  cs'2 cs,4 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% B = mm. 9-16 (enter tenor voice)

upper.B = \relative {
  \barNumberCheck #9
  \repeat unfold 8 { fs''8 a d cs a b | }
}

lower.B_tenor = \relative {
  r4 r8 a8\( fs' e |
  fs2 a8 b |
  <fs cs d,>2.\) |
  s2. |
  r4 r8 a,8\( fs' e |
  fs2 a8 b |
  <fs cs d,>2.\) |
  s2. |
}

lower.B_bass = \relative {
  <b, fs'>2. |
  s2. |
  c,4\rest c\rest a''8\rest a8^\( |
  d,2 cs4 |
  <b fs'>2.\) |
  s2. |
  c,4\rest c\rest a''8\rest a8 |
  d,2 cs4 |
}

lower.B = {
  \barNumberCheck #9
  \clef bass
  <<
    { \lower.B_tenor } \\
    { \lower.B_bass }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 17- (enter melody)

upper.C = \relative {
  \barNumberCheck #17
  <<
    \relative c''' {
      \stemNeutral
      r4 a4\( fs~ |
      2 d8 e |
      fs4 b,2~ |
      2.\) |
    }
    \\
    \relative c'' {
      <a d,>2. |
    }
  >>
  r4 a''\( fs~ |
  2 d8 e fs2.~ |
  2.\) |
  \barNumberCheck #25
  \repeat unfold 2 {
    <d a fs>2.\arpeggio |
    <e b gs>2.\arpeggio |
  }
  <<
    \set PianoStaff.connectArpeggios = ##t

    {
      <fs, d a>\(\arpeggio |
      a4(\arpeggio gs2)\)
    }
    \\
    {
      s2. |
      <e cs>2.\arpeggio
    }
  >> |
}

su = \stemUp
sn = \stemNeutral

lower.C_tenor = \relative {
  \stemNeutral
  \su fs8 a \sn d cs a b |
  fs8 a d cs a b |
  \su cs a \sn d cs a b |
  \su fs a d cs a b \sn |
  \su cs a \sn d cs a b |
  fs a d cs a b |
  \su cs a \sn d cs a b |
  \su fs a d cs a b |
  fs\( a \sn d cs a b |
  gs b e2\) |
  \su fs,8\( a \sn d cs a b |
  gs b e2\) |
  \su fs,8 a \sn d cs a b |
}

lower.C_bass = \relative {
  b,2. |
  s2. |
  d2. |
  r4 r4 cs4 |
  b2. |
  s2. |
  d2. |
  r4 r4 c4 |
  b2. |
  s2. |
  b2. |
  s2. |
  b2. |
  cs2. |
}

lower.C = {
  \barNumberCheck #17
  <<
    { \lower.C_tenor } \\
    { \lower.C_bass }
  >>
}

editorial.above = {
  s2.*16 |
  \barNumberCheck #17
  s4 s4^\markup \italic cantabile
}

editorial.between = {
  s8\p s8^\markup \italic legato s2 |
  s2.*14 |
  \barNumberCheck #16
  \poco_rit
  s8 s8\startTextSpan s8*3 s8\stopTextSpan |
  s8_\markup \italic { a tempo } s8 s4\p s4 |
  s2.*7 |
  \barNumberCheck #25
  s2.\mp |
}

editorial.below = {
  s8^\markup \italic { with plenty of pedal throughout }
}

reference.breaks = {
  s2.*5 | \break
  \barNumberCheck #6
  s2.*5 | \break
  \barNumberCheck #11
  s2.*5 | \break
  \barNumberCheck #16
  s2.*5 | \break
  \barNumberCheck #21
  s2.*5 | \break
  \barNumberCheck #26
  s2.*5 | \pageBreak
  \barNumberCheck #31
  s2.*5 | \break
  \barNumberCheck #36
  s2.*5 | \break
  \barNumberCheck #41
  s2.*5 | \break
  \barNumberCheck #46
  s2.*5 | \break
  \barNumberCheck #51
  s2.*5 | \break
  \barNumberCheck #56
  s2. | \pageBreak
  \barNumberCheck #57
  s2.*5 | \break
  \barNumberCheck #62
  s2.*5 | \break
  \barNumberCheck #67
  s2.*5 | \break
  \barNumberCheck #72
  s2.*5 | \break
  \barNumberCheck #77
  s2.*5 | \pageBreak
  \barNumberCheck #82
  s2.*5 | \break
  \barNumberCheck #87
  s2.*5 | \break
  \barNumberCheck #92
  s2.*5 | \break
  \barNumberCheck #97
  %% Time changes to 6/8, but that's still 2. per bar.
  s2.*5 | \break
  \barNumberCheck #102
  s2.*5 | \break
  \barNumberCheck #107
  s2.*5 | \pageBreak
  \barNumberCheck #112
  s2.*3 |
  \barNumberCheck #115
}


\new PianoStaff <<
  \new Dynamics {
    \global
    \editorial.above
  }
  \new Staff = "up" {
    \global
    \upper.A
    \upper.B
    \upper.C
  }
  \new Dynamics {
    \global
    \editorial.between
  }
  \new Staff = "down" {
    \global
    \lower.A
    \lower.B
    \lower.C
  }
  \new Dynamics {
    \global
    \editorial.below
  }
  \new Dynamics {
    \global
    \reference.breaks
  }
>>
