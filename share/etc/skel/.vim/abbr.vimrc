" =============================================================================
" Abbreviations
" =============================================================================
"  Moved the abbreviations *before* the mappings as
"  some of the abbreviations get used with some mappings.
"
"  Let's start of with some standard strings
"  like the alphabet and the digits:
"
"     Yalpha : The lower letter alphabet.
  iab ialpha abcdefghijklmnopqrstuvwxyz
"
"     YALPHA : The upper letter alphabet.
  iab IALPHA ABCDEFGHIJKLMNOPQRSTUVWXYZ
"
"     Ydigit: The ten digits.
  iab idigit  1234567890
"
"     Yruler: A "ruler" - nice for counting the length of words.
  iab iruler  1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890

  iab idate <C-R>=strftime("%Y-%m-%d")<CR>
