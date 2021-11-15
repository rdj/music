\version "2.20.0"
\language "english"
\pointAndClickOff

#(set-default-paper-size "letter")
\paper {
  print-page-number = ##f
}

\header {
  title = "Prelude in E minor"
  composer = "Frédéric Chopin"
  opus = "Op. 28, No. 4 (1839)"
  tagline = ##f
}

%% There were some differences between the French (Catelin) first edition and the
%% German (Breitkopf & Härtel) first edition. I've also chosen more modern
%% notation in a few instances.
%%
%% DYNAMICS (throughout)
%% B&H lacks the initial 'p' marking. This disagrees with Catelin and
%% every modern edition I consulted, so I've put that in. There is also
%% some disagreement on placement and lengths of crescendo and decrescendo
%% marks. Here I've treated Catelin as authoritative. I have not added
%% extra dynamics as is popular in modern teaching editions.
%%
%% PEDAL (throughout)
%% I've only included the two pedalings specifically noted in the
%% first editions. Some modern editions include pedal marks for the
%% entire piece, and it is modern practice to use the pedal throughout
%% to some degree, but I think the performer can be trusted to
%% identify the chord changes and be guided by their own judgement.
%%
%% ACCIDENTALS (mm. 5, 12, 18)
%% Both B&H and Catelin mark many accidentals that are redundant in
%% modern practice, without using parentheses. I have copied the same
%% accidentals. In measures 5, 12, and 18, some editions add an
%% explicit F♯ (LH), G♮ (RH) and D♮ (RH), respectively. Although that
%% would seem to be consistent with the other redundant accidentals,
%% I have not added them here.
%%
%% ACCENT MARKS (mm. 8, 12)
%% B&H contains two single-note long descrescendo marks. In measure 8,
%% Catelin shows this as a descrescendo extended over the entire length
%% of the G♯ tied into m. 9. In consulting other editions, this is
%% one of the places I saw the most disagreement. I'm deferring to the
%% Catelin here, since I treated it as authoritative for the other dynamic
%% marks.
%%
%% The very similar mark in m. 12 does not have an extended length in Catelin,
%% and modern editions are in much more consensus in treating it as an accent
%% mark, so I have rendered it thus.
%%
%% GRACE NOTES (mm. 11, 19)
%% B&H uses unslashed appoggiaturas, but Catelin and every modern edition
%% I could find use a slashed acciaccatura. Neither first but most modern
%% editions slur to the principal note, which I've done as well.
%%
%% TRIPLETS (mm. 12, 18)
%% I've used more modern notation for the triplets, with the explicit bracket.
%% The first editions just have a random 3 near the notes that almost looks
%% like a fingering indication.
%%
%% STRETTO (m. 16)
%% The dash-marked Stretto section ends mid-triplet in Catelin, but all
%% other editions I consulted extend it further, though they are not all
%% in agreement as to when it stops. B&H extends it all the way to the end
%% of the phrase. Most modern editions fall somewhere in between. I've
%% chosen to extend it to the note just after the triplet.
%%
%% TURN (m. 16)
%% In keeping with modern practice, I've noted the double sharp.
%%
%% ENDING (mm. 24-25)
%% B&H and Catelin use the same notation, but many modern editions change
%% to bass clef in the upper staff to simplify the reading. I've taken
%% the modern appraoch here.

sgr = #(define-music-function (note) (ly:music?) #{ \acciaccatura #note #})
espressivo = \markup { \small \italic "espressivo" }
dim = \markup { \small \italic "dim." }
smorz = \markup { \small \italic "smorz." }

\new PianoStaff <<
  \new Staff = "upper" {
    \clef treble
    \key e \minor
    \time 2/2
    \relative c' {
      \tempo Largo
      \partial 4
      \override TextSpanner.bound-details.left.text = \markup { \small \italic stretto }
      b8.\p\( b'16 |
      b2._\espressivo c4 |
      b2. c4 |
      b2. c4 |
      b2. bf4 |
      a2. b!4 |
      a2. b4 |
      a2. b8. a16 |
      a2.\) gs4~\> |
      << { gs }
         { s16 s\! } >>
      a8^\(\< b\! d\> c e, a\! |
      fs2.\) a4\( |
      fs2.\) \sgr b8^\( a4 |
      g8 fs c^>\< b ds fs \tuplet 3/2 { d'? c b\! } \) |
      b2.\( c4 |
      b2. c4 |
      b2. c4 |
      b8.\< as16
      << % delayed turn
        {
          as4 g'\>\startTextSpan
        }
        {
          s8
          \once \set suggestAccidentals = ##t
          \once \override AccidentalSuggestion.outside-staff-priority = ##f
          \once \override AccidentalSuggestion.avoid-slur = #'inside
          \once \override AccidentalSuggestion.font-size = -3
          \once \override AccidentalSuggestion.script-priority = -1
          \single \hideNotes
          ass4-\turn \noBeam % This is actually gss but that forces a natural on the following g we don't want
        }
      >>
      fs8. e16\! |
      e8\f ds c' ds, ds e g b, |
      d c \tuplet 3/2 { e e, a } fs4._\dim a8 |
      fs2.\p\)\stopTextSpan \sgr b8^\( a4 |
      fs2.~ 8.\< e16 |
      << { e2. } { s16 s\! } >>
      fs4_\smorz |
      e2. fs4 |
      e2\) r2\fermata |
      \clef bass
      <e b! fs e>2\pp\( <ds b fs ds> |
      <e b g e>1\)\fermata
      \bar "|."
    }
  }

  \new Staff = "lower" {
    \clef bass
    \key e \minor
    \relative c' {
      r4 |
      <e b g>8\( q q q q q q q |
      <e a, fs> q q q <ef a, fs> q q q |
      <ef a, f> q q q <d a f> q <d gs, f> q |
      \break
      <d gs, e> q q q <d g, e> q <cs g e> q |
      <c! g e> q q q <c fs, e> q q q |
      q q q q <c fs, ds> q q q |
      <c fs, d!> q q q q q q q |
      \break
      <c f, d> q q q <b f d> q q q |
      <b e, c> q <a e c> q q q q q |
      <a e b> q <a ds, b> q <a e c> q q q |
      <a ds, b> q q q <a e c> q q q |
      \break
      <a ds, b>4\) r4 r2 |
      <e' b g>8\( q q q q q q q |
      <e a, fs> q q q <ef a, f> q q q |
      <ef af, f> q q q <d gs, e!> q q q |
      \break
      <d g,! e> q <cs g e> q <as e cs> q <a e c> q |
      <b, b,>\)\sustainOn <a' c fs a>\( q
          << { q } % move the pedal release mark
             { s16 s\sustainOff } >>
          <fs' ds b g>8 <e b g> q q |
      <e c a>[ q] a,,\sustainOn
          << { <e' fs c'> }
             { s16 s\sustainOff } >>
          <b' e, b>8 q <a e c> q |
       <b e, b> q q q <a e c> q q q |
       \break
       <b e, b> q q q <b ds, b> q <a ds, b> q |
       <g c,> q q q <bf c,> q <a e c> q |
       <a e b> q <gs e b> q <g e b> q q q |
       <g c, bf>2\) r2\fermata |
       <b,! b,>2\( <b fs b,> |
       <e, e,>1\)\fermata
    }
  }
>>
