\version "2.24.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")

\paper {
  print-page-number = ##f
  indent = 0
  ragged-last = ##t
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

rit = {
  \override TextSpanner.bound-details.left.text = \markup { \italic "rit." }
  \textSpannerDown
}

rall = {
  \override TextSpanner.bound-details.left.text = \markup { \italic "rallentando" }
  \textSpannerDown
}

su = \stemUp
sd = \stemDown
sn = \stemNeutral

crpoco = #(make-music
           'CrescendoEvent
           'span-direction START
           'span-type 'text
           'span-text "cresc. poco a poco")

twice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 2 $music #})
thrice = #(define-music-function (music) (ly:music?) #{ \repeat unfold 3 $music #})

global = {
  \key d \major
  \time 3/4
  \set Timing.beamExceptions = #'() % Beam each beat separately in 3/4 instead of the whole measure
}

measureNinetySeven = {
  \key c \major
  \time 6/8
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% A = mm. 1-8

upper.A = \relative {
  fs''8 a d cs a b |
  \repeat unfold 7 { fs a d cs a b | }
}

lower.A = \relative {
  <b fs'>2. |
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
%% C = mm. 17-32 (enter melody)

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
%% D = mm. 33-40 (a tempo)

upper.D = \relative {
  \barNumberCheck #33
   <<
     \relative {
       \sn
       r4 <a' d a'>4\( fs'~ |
       2 d8 e |
       <fs b, a>4\arpeggio \su b,2~\) |
       2.
     } \\
     \relative {
       s4 s4 fs'~ |
       2 s4 |
       s2. |
       r4 <e cs>( <fs d>)
     }
   >> |
   r4 <a' d a'>4 <fs fs'>4~ |
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

lower.D_tenor = \relative {
  r8 \su fs \sn cs' fs, d' fs, |
  r \su fs cs' fs, d' r |
  r \su a \sn cs a d a |
  r \su a cs a d a \sn |
  r \su fs \sn cs' fs, d' fs, |
  r \su fs \sn cs' fs, d' fs, |
  r \su a e'\( a, fs' a, |
  g' a, fs' a, e'\) a, \sn |
}

lower.D_bass = \relative {
  b,,2. |
  b'2 b,8 cs |
  d2. |
  d'2 cs,4 |
  b2. |
  b' |
  d2.~ |
  2 cs,4 |
}

lower.D = {
  \barNumberCheck #33
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.D_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.D_bass
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E = mm. 41-56 (melody to bass)

upper.E = \relative {
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

lower.E = \relative {
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% F = mm. 57-72 (Slightly slower)

upper.F = \relative {
  \barNumberCheck #57
  r4
  \ottava #1
  <a'' d a'>\arpeggio\( <fs fs'>~\arpeggio |
  q2 d'8 e |
  \acciaccatura e8 fs4 b,2~
  2.\) |
  r4 <a d a'>\arpeggio\( <fs fs'>~\arpeggio |
  q2 d'8 e |
  \acciaccatura e8 fs2.~ |
  2.\) |
  <fs, a d>2.\arpeggio |
  <gs b e>2.\arpeggio |
  <fs a d>2.\arpeggio |
  <gs b e>2.\arpeggio |
  <a d fs>2.\arpeggio |
  <<
    { a'4( gs2) }
    \\
    { \acciaccatura b,8 cs2. }
  >> |
  \ottava #0
  <a, d fs>2.\arpeggio |
  <as d e>2( <cs e g>4) |
}

%% Note: mm. 57-66 are notated in three staves
middle.F = \relative {
  \clef treble
  \barNumberCheck #57
  r8\p_\markup \italic {molto legato} fs\( b cs d fs |
  a fs a cs d4\) |
  r8 a,\( d e fs a |
  cs b d cs a b\) |
  r fs,\( b cs d fs |
  a fs a cs d4\) |
  r8 a,\( d e fs a |
  cs b d cs a b\) |
  fs\( a d cs a b |
  gs b e2\) |
  \barNumberCheck #67
}

lower.F_tenor = \relative {
  s2.*10 |
  \barNumberCheck #67
  \clef treble
  fs'8\( a d cs a b |
  gs b e2\) |
  b8\rest fs d' cs a b |
  R2. |
  \clef bass
  r8 \su fs, \sn d' cs a b |
  r8 \su cs \sn g' fs e cs |
}

lower.F_bass = \relative {
  b,2.~ |
  2. |
  d2.~ |
  2 c4 |
  b2.~ |
  2. |
  d2.~ |
  2. |
  b'2.~ |
  2. |
  b2. ~ |
  2. |
  b2. |
  cs2. |
  b,2. |
  fs'2. |
}

lower.F = {
  \barNumberCheck #57
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.F_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.F_bass
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% D′ = mm. 73-80 (Tempo I), variation of D (mm. 33-40)

upper.D′ = \relative {
  \barNumberCheck #73
  <<
    \relative {
      r4 <a' d a'>4\( fs'~ |
      2 d8 e |
      fs4 b,2~ |
      2.\)
    } \\
    \relative {
      s4 s4 \su fs'~ |
      2 \sd s4 |
      <b a>2. |
      r4 e, fs
    }
  >> |
  r4 <a' d a'>4\( <fs fs'>4~ |
  q2 d'8 e |
  \acciaccatura e8 fs2.~ |
  2.\) |
}

lower.D′_tenor = \relative {
  \twice { r8 fs cs' fs, d' fs, | }
  \twice { r8 a cs a d a } |
  \twice { r8 fs cs' fs, d' fs, | }
  r \su a e' a, fs' a, |
  g' a, fs' a, e' a, \sn |
}

lower.D′_bass = \relative {
  b,2. |
  b, |
  d' |
  d,2 c'4 |
  b2. |
  b, |
  d'~ |
  2. |
}

lower.D′ = {
  \barNumberCheck #73
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.D′_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.D′_bass
    }
  >>
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% E′ = mm. 81-96 (cresc poco a poco), variation of mm. 41-56

upper.E′ = \relative {
  \barNumberCheck #81
  \twice { \thrice { <c' d fs>8 a8 } | }
  \thrice { <b d fs> fs } |
  \thrice { <c' d f> f, } |
  <a b? ds>8 fs? \twice { <a b ds>8 fs } |
  \thrice { <a b ds>8 fs } |
  \thrice { <gs b ds> ds } |
  <g? b d?> d? <g b d> d <b' d f>4 |
  \thrice { <a' cs e>8 g } |
  \thrice { <bf d f> b } |
  \thrice { <a cs e> g } |
  \thrice { <bf d> g } |
  \thrice { <a cs e> g } |
  \thrice { <a bf d> g } |
  \thrice { <a cs e> g } |
  \twice { <bf d> g } <g cs e>4 |
}

lower.E′ = \relative {
  \barNumberCheck #81
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
  2\) a4 |
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% G = mm. 97- (A tempo, resolute)

upper.G_soprano = \relative {
  \thrice {
    d'4. <d a'>4.~ |
    q2. |
  }
  <a c f>4. <f' c'> |
  <g, b d> a'8 g16 a b8 |
  <a d,>4.
  <d a'>4.~ |
  q2. |
  <d a d,>4. <a d a'>~ |
  2. |
  <d a d,>4. <a d a'>~ |
  2. |
  s2. |
  s2. |
  s2. |
  <a' d e a>2.\arpeggio |
}

upper.G_alto = \relative {
  s2.*7 |
  \barNumberCheck #104
  s4. g'4. |
  s2. |
  <c, a>16 d8 8 16 <c a>16 d8 8 16 |
  s2. |
  <c g>16 d8 8 16 <e g,>16 d8 8 16 |
  s2. |
  d'16 a g fs g a d a g fs g a |
  <d a d,>4. <a d f>~ |
  4.~ 8 <g c e>8. <g c>16 |
  <d a' d>2.~ |
  2.\fermata |
}

upper.G = {
  \barNumberCheck #97
  \measureNinetySeven
  <<
    \new Voice = "soprano" {
      \voiceOne
      \upper.G_soprano
    }
    \new Voice = "alto" {
      \voiceTwo
      \upper.G_alto
    }
  >>
}

lower.G_tenor = \relative {
  \repeat unfold 10 { d8. 8 16 8 8 8 | }
  \repeat unfold 2 { c8. 8 16 8 8 8 | }
  \repeat unfold 2 { b8. 8 16 8 8 8 | }
  bf8. 8 16 8 8 8 |
  bf8. 8 16 8 c8 8 |
  d8. 8 16 8 4 |
}

lower.G_bass = \relative {
  \thrice { <d, a'>2. | }
  d4.~ 8 a4 |
  <d a'>2. |
  <d a'>4.~ q8 a4 |
  <d a'>2. |
  <d a'>4.~ 8 a d |
  <d a'>2.~ |
  q2. |
  <c g>2. |
  <c g>2. |
  b2. |
  b2. |
  bf2. |
  bf4.~ 8 c4 |
  <d a'>2. |
  <d a'>2.\fermata |
}

lower.G = {
  \barNumberCheck #97
  \measureNinetySeven
  <<
    \new Voice = "tenor" {
      \voiceOne
      \lower.G_tenor
    }
    \new Voice = "bass" {
      \voiceTwo
      \lower.G_bass
    }
  >>
}

editorial.above = {
  \tempo "Calmly, but with movement" 4 = 82
  s2.*16 |
  \barNumberCheck #17
  s4 s4^\markup \italic cantabile s4 |
  s2.*39 |
  \barNumberCheck #57
  \tempo "Slightly slower" s2. |
  s2.*15 |
  \barNumberCheck #73
  \tempo "Tempo I" s2. |
  s2.*22 |
  \barNumberCheck #96
  s2 s8 s16 s32 s32^\markup { \note {8} #UP = \note {8} #UP } |
  \tempo "A tempo, resolute" s2. |
  s2.*14
  \barNumberCheck #112
  s4. s8 s8-\markup \italic { sempre \musicglyph #"f" } s8 |
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
  s8 s8_\markup \italic { en dehors } s4 s4 |
  s2.*16 |
  \barNumberCheck #56
  s4 s8\startTextSpan s8 s8 s8\stopTextSpan |
  s4_\markup \italic {tranquillo} s4\mp s4 |
  s2.*9 |
  \barNumberCheck #67
  s2.\p |
  s2. |
  s2.\pp |
  s2.*2 |
  \barNumberCheck #72
  s8 s8\cresc s4 s4 |
  s4\mp s2 |
  s2.*5 |
  \barNumberCheck #79
  s8 s8^\markup \italic { en dehors } s4 s4 |
  s2. |
  \barNumberCheck #81
  s2.\crpoco |
  s2.*7 |
  \barNumberCheck #89
  s2.\mf |
  s2.*6 |
  \barNumberCheck #96
  \rit
  s8\startTextSpan s8 s4 s8 s16 s32 s32\stopTextSpan |
  s2.\mf |
  s2.*7 |
  \barNumberCheck #105
  s2.\f |
  s2.*6 |
  \barNumberCheck #112
  \rall
  s4. s4.\startTextSpan |
  s2. |
  s2.\stopTextSpan
}

editorial.below = {
  s2.^\markup \italic { with plenty of pedal throughout } |
  s2.*54 |
  \barNumberCheck #56
  s2 s4\ppp |
}

breaks = {
  s2.*8 |
  \barNumberCheck #9
  \break
  s2.*8 |
  \barNumberCheck #17
  \break
  s2.*16 |
  \barNumberCheck #33
  \break
  s2.*24 |
  \barNumberCheck #57
  \break
  s2.*16 |
  \barNumberCheck #73
  \break
  s2.*24 |
  \barNumberCheck #97
  \pageBreak
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

%showLastLength = R2.*15
\new PianoStaff \with {
  \remove "Keep_alive_together_engraver"
} <<
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
    \upper.E
    \upper.F
    \upper.D′
    \upper.E′
    \upper.G
    \bar "|."
  }
  \new Dynamics {
    \global
    \editorial.between
  }
  \new Staff = "middle" \with {
    \RemoveAllEmptyStaves
  } {
    \global
    s2.*56 |
    \middle.F
  }
  \new Staff = "down" {
    \global
    \lower.A
    \lower.B
    \lower.C
    \lower.D
    \lower.E
    \lower.F
    \lower.D′
    \lower.E′
    \lower.G
  }
  \new Dynamics {
    \global
    \editorial.below
  }
  \new Dynamics {
    \global
    %%\reference.breaks
    \breaks
  }
>>
