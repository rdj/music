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

su = \stemUp
sd = \stemDown
sn = \stemNeutral

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
thrice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 3 $music #})

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
    \new Voice = "tenor" {
      \voiceOne
      \lower.B_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.B_bass
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% C = mm. 17-40 (enter melody) -- could probably split this up a bit

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
  <a d,>2.\arpeggio |
   <as cs e>2( <cs e g>4) |
   <<
     \relative {
       \sn
       r4 <a' d a'>4\( fs'~ |
       2 d8 e |
       <fs b, a>4\arpeggio \su b,2\)~ |
       2.
     } \\
     \relative {
       s4 s4 fs'~ |
       2 s4 |
       s2. |
       r4 <e cs>( <fs d>)
     }
   >> |
   r4 <a d a'>4 <fs fs'>4~ |
   q2 d'8 e |
   <<
     \relative {
       \sd
       \acciaccatura e''8 fs2.~ |
       2.
     } \\
     \relative {
       a'2.~ |
       2.
     } |
   >>
}

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
  s2. |
  r8 \su fs \sn d' cs a b |
  r \su cs \sn g' fs e cs |
  r \su fs, \sn cs' fs, d' fs, |
  r \su fs cs' fs, d' r |
  r \su a \sn cs a d a |
  r \su a cs a d a \sn |
  r \su fs \sn cs' fs, d' fs, |
  r \su fs \sn cs' fs, d' fs, |
  r \su a e'\( a, fs' a, g' a, fs' a, e'\) a, \sn |
}

lower.C_bass = \relative {
  b,2. |
  s |
  d |
  r4 r4 cs4 |
  b2. |
  s |
  d |
  r4 r4 c4 |
  b2. |
  s |
  b |
  s |
  b |
  cs |
  e |
  fs |
  b,, |
  b'2 b,8 cs |
  d2. |
  d'2 cs,4 |
  b2. |
  b' |
  d2.~ |
  2 cs,4 |
}

lower.C = {
  \barNumberCheck #17
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.C_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.C_bass
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D = mm. 41-56 (melody to bass)

upper.D = \relative {
  \barNumberCheck #41
  \twice { \thrice { <c' d fs>8 a8 } | }
  \thrice { <b d fs> fs } |
  \thrice { <bf d f> f } |
  <a b? ds>8 fs? \twice { <a b ds>8 fs } |
  \thrice { <a b ds>8 fs } |
  \thrice { <gs b ds> ds } |
  <g? b d?> d? \twice { <g b d> d } |
  \thrice { <a' cs e> g } |
  \thrice { <bf d f> b } |
  \thrice { <a cs e> g } |
  \thrice { <bf d> g } |
  \thrice { <a cs e> g } |
  \twice { <bf df f> g } <bf d f> g |
  \thrice { <a cs e> g } |
  \twice { <bf d> g } <a cs e> g |
}

lower.D = \relative {
  \barNumberCheck #41
  c,2.~\( |
  4 d-> c |
  b2. |
  bf\) |
  a~\( |
  4 b-> a |
  gs2. |
  g?\) |
  a4.\( g8 a4 |
  bf4 g2 |
  a4 e'2~ |
  2.\) |
  a,4.\( g8 a4 |
  bf4 g2 |
  a4 e'2~ |
  2\) fs,4 |
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
  s2.*5 |
  \barNumberCheck #31
  s2.\pp |
  s8\startTextSpan s8 s4 s8 s8\stopTextSpan |
  s2._\markup \italic { a tempo }\mf |
  s2.*5 |
  \barNumberCheck #39
  s2._\markup \italic { en dehors } |
  s2.*16 |
  \barNumberCheck #56
  s8\startTextSpan s8 s8 s8 s8 s8\stopTextSpan |
}

editorial.below = {
  s2.^\markup \italic { with plenty of pedal throughout } |
  s2.*54 |
  \barNumberCheck #56
  s2 s4\ppp |
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
  \new Staff = "up" \with {
    %% Allow arpeggios to span voices
    \consists "Span_arpeggio_engraver"
    connectArpeggios = ##t
  } {
    \global
    \upper.A
    \upper.B
    \upper.C
    \upper.D
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
    \lower.D
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
