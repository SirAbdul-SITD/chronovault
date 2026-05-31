import '../engine/round_model.dart';

final List<VaultRound> kVaultRounds = [
  // ── ROUND 1 ──────────────────────────────────────────────
  VaultRound(
    id: 1, tier: 1,
    category: 'Science & Discovery',
    timeLimitSecs: 60,
    events: [
      VaultEvent(year: 1687, label: 'Newton publishes laws of motion'),
      VaultEvent(year: 1796, label: 'Jenner creates first vaccine'),
      VaultEvent(year: 1859, label: 'Darwin publishes On the Origin of Species'),
      VaultEvent(year: 1898, label: 'Marie Curie discovers radium'),
      VaultEvent(year: 1953, label: 'DNA double helix structure revealed'),
      VaultEvent(year: 1990, label: 'Hubble Space Telescope launched'),
    ],
  ),
  // ── ROUND 2 ──────────────────────────────────────────────
  VaultRound(
    id: 2, tier: 1,
    category: 'Ancient Empires',
    timeLimitSecs: 60,
    events: [
      VaultEvent(year: -3100, label: 'Egyptian unification under first pharaoh'),
      VaultEvent(year: -753,  label: 'Founding of Rome'),
      VaultEvent(year: -336,  label: 'Alexander the Great begins conquest'),
      VaultEvent(year: -221,  label: 'Qin Shi Huang unifies China'),
      VaultEvent(year: 476,   label: 'Fall of the Western Roman Empire'),
      VaultEvent(year: 632,   label: 'Death of Prophet Muhammad'),
    ],
  ),
  // ── ROUND 3 ──────────────────────────────────────────────
  VaultRound(
    id: 3, tier: 1,
    category: 'Inventions',
    timeLimitSecs: 60,
    events: [
      VaultEvent(year: 1440, label: 'Gutenberg printing press invented'),
      VaultEvent(year: 1769, label: 'Watt patents improved steam engine'),
      VaultEvent(year: 1879, label: 'Edison demonstrates electric light bulb'),
      VaultEvent(year: 1903, label: 'Wright brothers first powered flight'),
      VaultEvent(year: 1926, label: 'John Logie Baird demonstrates television'),
      VaultEvent(year: 1969, label: 'ARPANET (internet precursor) goes live'),
    ],
  ),
  // ── ROUND 4 ──────────────────────────────────────────────
  VaultRound(
    id: 4, tier: 1,
    category: 'World Wars',
    timeLimitSecs: 60,
    events: [
      VaultEvent(year: 1914, label: 'Assassination of Archduke Franz Ferdinand'),
      VaultEvent(year: 1917, label: 'United States enters WWI'),
      VaultEvent(year: 1918, label: 'Armistice ends World War I'),
      VaultEvent(year: 1939, label: 'Germany invades Poland — WWII begins'),
      VaultEvent(year: 1944, label: 'D-Day landings at Normandy'),
      VaultEvent(year: 1945, label: 'Japan surrenders — WWII ends'),
    ],
  ),
  // ── ROUND 5 ──────────────────────────────────────────────
  VaultRound(
    id: 5, tier: 1,
    category: 'Space Age',
    timeLimitSecs: 58,
    events: [
      VaultEvent(year: 1957, label: 'Sputnik 1 becomes first satellite in orbit'),
      VaultEvent(year: 1961, label: 'Yuri Gagarin first human in space'),
      VaultEvent(year: 1969, label: 'Apollo 11 — humans land on the Moon'),
      VaultEvent(year: 1977, label: 'Voyager 1 and 2 launched'),
      VaultEvent(year: 1998, label: 'International Space Station construction begins'),
      VaultEvent(year: 2012, label: 'Curiosity rover lands on Mars'),
    ],
  ),
  // ── ROUND 6 ──────────────────────────────────────────────
  VaultRound(
    id: 6, tier: 1,
    category: 'Medicine',
    timeLimitSecs: 58,
    events: [
      VaultEvent(year: 1628, label: 'Harvey describes blood circulation'),
      VaultEvent(year: 1846, label: 'First surgery under general anaesthesia'),
      VaultEvent(year: 1895, label: 'Röntgen discovers X-rays'),
      VaultEvent(year: 1928, label: 'Fleming discovers penicillin'),
      VaultEvent(year: 1967, label: 'First human heart transplant by Barnard'),
      VaultEvent(year: 2020, label: 'mRNA vaccines developed for COVID-19'),
    ],
  ),
  // ── ROUND 7 ──────────────────────────────────────────────
  VaultRound(
    id: 7, tier: 1,
    category: 'Revolutions',
    timeLimitSecs: 56,
    events: [
      VaultEvent(year: 1776, label: 'American Declaration of Independence'),
      VaultEvent(year: 1789, label: 'French Revolution begins'),
      VaultEvent(year: 1848, label: 'Year of Revolutions across Europe'),
      VaultEvent(year: 1917, label: 'Russian Revolution — Tsar abdicates'),
      VaultEvent(year: 1949, label: '''People's Republic of China proclaimed'''),
      VaultEvent(year: 1989, label: 'Fall of the Berlin Wall'),
    ],
  ),
  // ── ROUND 8 ──────────────────────────────────────────────
  VaultRound(
    id: 8, tier: 1,
    category: 'Great Explorers',
    timeLimitSecs: 56,
    events: [
      VaultEvent(year: 1271, label: 'Marco Polo departs for Asia'),
      VaultEvent(year: 1492, label: 'Columbus reaches the Americas'),
      VaultEvent(year: 1498, label: 'Vasco da Gama reaches India by sea'),
      VaultEvent(year: 1519, label: 'Magellan expedition circumnavigates globe'),
      VaultEvent(year: 1770, label: 'Captain Cook maps the Australian coast'),
      VaultEvent(year: 1911, label: 'Amundsen reaches the South Pole'),
    ],
  ),
  // ── ROUND 9 ──────────────────────────────────────────────
  VaultRound(
    id: 9, tier: 1,
    category: 'Technology',
    timeLimitSecs: 55,
    events: [
      VaultEvent(year: 1876, label: 'Bell patents the telephone'),
      VaultEvent(year: 1947, label: 'Transistor invented at Bell Labs'),
      VaultEvent(year: 1971, label: 'Intel releases first microprocessor'),
      VaultEvent(year: 1991, label: 'World Wide Web goes public'),
      VaultEvent(year: 2007, label: 'First iPhone unveiled by Steve Jobs'),
      VaultEvent(year: 2023, label: 'ChatGPT surpasses 100 million users'),
    ],
  ),
  // ── ROUND 10 ──────────────────────────────────────────────
  VaultRound(
    id: 10, tier: 1,
    category: 'Philosophy & Literature',
    timeLimitSecs: 55,
    events: [
      VaultEvent(year: -428, label: 'Plato born in Athens'),
      VaultEvent(year: 1605, label: 'Cervantes publishes Don Quixote'),
      VaultEvent(year: 1667, label: 'Milton publishes Paradise Lost'),
      VaultEvent(year: 1813, label: 'Jane Austen publishes Pride and Prejudice'),
      VaultEvent(year: 1851, label: 'Melville publishes Moby-Dick'),
      VaultEvent(year: 1949, label: 'Orwell publishes Nineteen Eighty-Four'),
    ],
  ),
  // ── ROUND 11 ──────────────────────────────────────────────
  VaultRound(
    id: 11, tier: 2,
    category: 'Cold War',
    timeLimitSecs: 55,
    events: [
      VaultEvent(year: 1947, label: 'Truman Doctrine announced'),
      VaultEvent(year: 1950, label: 'Korean War begins'),
      VaultEvent(year: 1962, label: 'Cuban Missile Crisis'),
      VaultEvent(year: 1972, label: 'Nixon visits China'),
      VaultEvent(year: 1979, label: 'Soviet Union invades Afghanistan'),
      VaultEvent(year: 1991, label: 'Dissolution of the Soviet Union'),
    ],
  ),
  // ── ROUND 12 ──────────────────────────────────────────────
  VaultRound(
    id: 12, tier: 2,
    category: 'African History',
    timeLimitSecs: 54,
    events: [
      VaultEvent(year: -1550, label: 'New Kingdom of Egypt rises'),
      VaultEvent(year: 700,   label: 'Ghana Empire dominates West Africa'),
      VaultEvent(year: 1324,  label: '''Mansa Musa's legendary pilgrimage to Mecca'''),
      VaultEvent(year: 1884,  label: 'Berlin Conference divides Africa'),
      VaultEvent(year: 1957,  label: 'Ghana becomes first independent African nation'),
      VaultEvent(year: 1994,  label: 'End of Apartheid in South Africa'),
    ],
  ),
  // ── ROUND 13 ──────────────────────────────────────────────
  VaultRound(
    id: 13, tier: 2,
    category: 'Natural Disasters',
    timeLimitSecs: 54,
    events: [
      VaultEvent(year: 79,   label: 'Mt. Vesuvius erupts — Pompeii buried'),
      VaultEvent(year: 1556, label: 'Shaanxi earthquake, deadliest ever recorded'),
      VaultEvent(year: 1883, label: 'Krakatoa eruption — global temperature drop'),
      VaultEvent(year: 1906, label: 'San Francisco earthquake and fire'),
      VaultEvent(year: 1970, label: 'Bhola cyclone kills 500,000 in Bangladesh'),
      VaultEvent(year: 2004, label: 'Indian Ocean tsunami kills 230,000'),
    ],
  ),
  // ── ROUND 14 ──────────────────────────────────────────────
  VaultRound(
    id: 14, tier: 2,
    category: 'Music Milestones',
    timeLimitSecs: 53,
    events: [
      VaultEvent(year: 1723, label: 'Bach composes Brandenburg Concertos'),
      VaultEvent(year: 1824, label: 'Beethoven premieres Symphony No. 9'),
      VaultEvent(year: 1956, label: 'Elvis Presley appears on Ed Sullivan Show'),
      VaultEvent(year: 1963, label: 'Beatles release Please Please Me'),
      VaultEvent(year: 1982, label: 'Michael Jackson releases Thriller'),
      VaultEvent(year: 1999, label: 'Napster launches and disrupts music industry'),
    ],
  ),
  // ── ROUND 15 ──────────────────────────────────────────────
  VaultRound(
    id: 15, tier: 2,
    category: 'Asian Empires',
    timeLimitSecs: 53,
    events: [
      VaultEvent(year: 618,  label: 'Tang Dynasty founded in China'),
      VaultEvent(year: 1206, label: 'Genghis Khan unites Mongol tribes'),
      VaultEvent(year: 1526, label: 'Babur founds Mughal Empire in India'),
      VaultEvent(year: 1603, label: 'Tokugawa Shogunate established in Japan'),
      VaultEvent(year: 1858, label: 'British Crown takes control of India'),
      VaultEvent(year: 1912, label: 'Qing Dynasty collapses — Republic of China'),
    ],
  ),
  // ── ROUND 16 ──────────────────────────────────────────────
  VaultRound(
    id: 16, tier: 2,
    category: 'Cinema History',
    timeLimitSecs: 52,
    events: [
      VaultEvent(year: 1895, label: 'Lumière brothers show first film to public'),
      VaultEvent(year: 1927, label: 'The Jazz Singer — first talkie film'),
      VaultEvent(year: 1939, label: 'The Wizard of Oz and Gone with the Wind released'),
      VaultEvent(year: 1977, label: 'Star Wars transforms cinema'),
      VaultEvent(year: 1993, label: 'Jurassic Park showcases CGI revolution'),
      VaultEvent(year: 2010, label: 'Avatar becomes highest-grossing film'),
    ],
  ),
  // ── ROUND 17 ──────────────────────────────────────────────
  VaultRound(
    id: 17, tier: 2,
    category: 'Climate & Environment',
    timeLimitSecs: 52,
    events: [
      VaultEvent(year: 1864, label: 'George Perkins Marsh warns of deforestation'),
      VaultEvent(year: 1962, label: 'Rachel Carson publishes Silent Spring'),
      VaultEvent(year: 1970, label: 'First Earth Day held in the US'),
      VaultEvent(year: 1987, label: 'Montreal Protocol bans ozone-depleting chemicals'),
      VaultEvent(year: 1997, label: 'Kyoto Protocol on climate change signed'),
      VaultEvent(year: 2015, label: 'Paris Agreement adopted by 196 nations'),
    ],
  ),
  // ── ROUND 18 ──────────────────────────────────────────────
  VaultRound(
    id: 18, tier: 2,
    category: 'Olympics',
    timeLimitSecs: 51,
    events: [
      VaultEvent(year: -776, label: 'First recorded ancient Olympic Games'),
      VaultEvent(year: 1896, label: 'First modern Olympics in Athens'),
      VaultEvent(year: 1936, label: 'Jesse Owens wins 4 golds in Berlin'),
      VaultEvent(year: 1968, label: 'Black Power salute at Mexico City Olympics'),
      VaultEvent(year: 1972, label: 'Munich massacre at Summer Olympics'),
      VaultEvent(year: 1992, label: 'Barcelona Olympics — Dream Team debuts'),
    ],
  ),
  // ── ROUND 19 ──────────────────────────────────────────────
  VaultRound(
    id: 19, tier: 2,
    category: 'Women in History',
    timeLimitSecs: 51,
    events: [
      VaultEvent(year: 1848, label: '''Seneca Falls Convention on women's rights'''),
      VaultEvent(year: 1903, label: 'Marie Curie wins first Nobel Prize'),
      VaultEvent(year: 1920, label: '19th Amendment gives US women right to vote'),
      VaultEvent(year: 1963, label: 'Valentina Tereshkova — first woman in space'),
      VaultEvent(year: 1979, label: 'Margaret Thatcher becomes UK Prime Minister'),
      VaultEvent(year: 2021, label: 'Kamala Harris becomes US Vice President'),
    ],
  ),
  // ── ROUND 20 ──────────────────────────────────────────────
  VaultRound(
    id: 20, tier: 2,
    category: 'Medieval Europe',
    timeLimitSecs: 51,
    events: [
      VaultEvent(year: 800,  label: 'Charlemagne crowned Holy Roman Emperor'),
      VaultEvent(year: 1066, label: 'William the Conqueror wins Battle of Hastings'),
      VaultEvent(year: 1096, label: 'First Crusade begins'),
      VaultEvent(year: 1215, label: 'Magna Carta signed by King John'),
      VaultEvent(year: 1347, label: 'Black Death reaches Europe'),
      VaultEvent(year: 1453, label: 'Fall of Constantinople to Ottomans'),
    ],
  ),
  // ── ROUND 21 ──────────────────────────────────────────────
  VaultRound(
    id: 21, tier: 2,
    category: 'Economy & Finance',
    timeLimitSecs: 50,
    events: [
      VaultEvent(year: 1602, label: 'Dutch East India Company — first corporation'),
      VaultEvent(year: 1776, label: 'Adam Smith publishes The Wealth of Nations'),
      VaultEvent(year: 1848, label: 'Marx and Engels publish The Communist Manifesto'),
      VaultEvent(year: 1929, label: 'Wall Street Crash — Great Depression begins'),
      VaultEvent(year: 1944, label: 'Bretton Woods monetary system established'),
      VaultEvent(year: 2008, label: 'Global financial crisis — Lehman Brothers collapses'),
    ],
  ),
  // ── ROUND 22 ──────────────────────────────────────────────
  VaultRound(
    id: 22, tier: 2,
    category: 'Arctic & Antarctic',
    timeLimitSecs: 50,
    events: [
      VaultEvent(year: 1773, label: 'Captain Cook crosses the Antarctic Circle'),
      VaultEvent(year: 1820, label: 'Antarctica continent first sighted'),
      VaultEvent(year: 1909, label: 'Peary claims to reach the North Pole'),
      VaultEvent(year: 1911, label: 'Amundsen reaches South Pole first'),
      VaultEvent(year: 1959, label: 'Antarctic Treaty protects the continent'),
      VaultEvent(year: 2012, label: 'Russia drills into Lake Vostok'),
    ],
  ),
  // ── ROUND 23 ──────────────────────────────────────────────
  VaultRound(
    id: 23, tier: 2,
    category: 'Art Movements',
    timeLimitSecs: 50,
    events: [
      VaultEvent(year: 1503, label: 'Leonardo paints the Mona Lisa'),
      VaultEvent(year: 1827, label: 'Goya completes Los Caprichos etchings'),
      VaultEvent(year: 1874, label: 'First Impressionist exhibition in Paris'),
      VaultEvent(year: 1907, label: '''Picasso paints Les Demoiselles d'Avignon'''),
      VaultEvent(year: 1917, label: 'Duchamp exhibits Fountain — birth of conceptual art'),
      VaultEvent(year: 1962, label: '''Andy Warhol's Campbell's Soup Cans exhibited'''),
    ],
  ),
  // ── ROUND 24 ──────────────────────────────────────────────
  VaultRound(
    id: 24, tier: 3,
    category: 'Latin America',
    timeLimitSecs: 48,
    events: [
      VaultEvent(year: 1438, label: 'Inca Empire reaches its peak'),
      VaultEvent(year: 1521, label: 'Cortés conquers the Aztec Empire'),
      VaultEvent(year: 1811, label: 'Venezuela declares independence'),
      VaultEvent(year: 1823, label: 'Monroe Doctrine proclaimed'),
      VaultEvent(year: 1959, label: 'Cuban Revolution — Castro takes power'),
      VaultEvent(year: 2002, label: 'Brazil wins fifth FIFA World Cup'),
    ],
  ),
  // ── ROUND 25 ──────────────────────────────────────────────
  VaultRound(
    id: 25, tier: 3,
    category: 'Industrial Revolution',
    timeLimitSecs: 48,
    events: [
      VaultEvent(year: 1733, label: 'Flying shuttle invented by John Kay'),
      VaultEvent(year: 1769, label: 'Watt patents improved steam engine'),
      VaultEvent(year: 1807, label: 'Robert Fulton launches first steamboat'),
      VaultEvent(year: 1825, label: 'First passenger steam railway opens'),
      VaultEvent(year: 1844, label: 'Morse sends first telegraph message'),
      VaultEvent(year: 1886, label: 'Benz patents the first automobile'),
    ],
  ),
  // ── ROUND 26 ──────────────────────────────────────────────
  VaultRound(
    id: 26, tier: 3,
    category: 'Epidemics & Pandemics',
    timeLimitSecs: 48,
    events: [
      VaultEvent(year: 541,  label: 'Plague of Justinian devastates Eastern Roman Empire'),
      VaultEvent(year: 1347, label: 'Black Death kills third of Europe\'s population'),
      VaultEvent(year: 1665, label: 'Great Plague of London'),
      VaultEvent(year: 1918, label: 'Spanish Flu kills 50–100 million people'),
      VaultEvent(year: 1981, label: 'First AIDS cases reported in the US'),
      VaultEvent(year: 2020, label: 'COVID-19 declared a global pandemic'),
    ],
  ),
  // ── ROUND 27 ──────────────────────────────────────────────
  VaultRound(
    id: 27, tier: 3,
    category: 'Architecture',
    timeLimitSecs: 47,
    events: [
      VaultEvent(year: -2560, label: 'Great Pyramid of Giza completed'),
      VaultEvent(year: -447,  label: 'Construction of the Parthenon begins'),
      VaultEvent(year: 72,    label: 'Colosseum construction begins in Rome'),
      VaultEvent(year: 1163,  label: 'Construction of Notre-Dame Cathedral begins'),
      VaultEvent(year: 1889,  label: 'Eiffel Tower completed'),
      VaultEvent(year: 1931,  label: 'Empire State Building completed'),
    ],
  ),
  // ── ROUND 28 ──────────────────────────────────────────────
  VaultRound(
    id: 28, tier: 3,
    category: 'Oceania',
    timeLimitSecs: 47,
    events: [
      VaultEvent(year: -40000, label: 'First humans arrive in Australia'),
      VaultEvent(year: 1000,   label: 'Polynesians settle New Zealand'),
      VaultEvent(year: 1788,   label: 'British First Fleet arrives in Sydney'),
      VaultEvent(year: 1851,   label: 'Gold rush begins in Victoria, Australia'),
      VaultEvent(year: 1901,   label: 'Commonwealth of Australia proclaimed'),
      VaultEvent(year: 2000,   label: 'Sydney hosts the Olympic Games'),
    ],
  ),
  // ── ROUND 29 ──────────────────────────────────────────────
  VaultRound(
    id: 29, tier: 3,
    category: 'Genetics & Biology',
    timeLimitSecs: 46,
    events: [
      VaultEvent(year: 1859, label: 'Darwin publishes theory of evolution'),
      VaultEvent(year: 1866, label: 'Mendel presents his laws of heredity'),
      VaultEvent(year: 1953, label: 'Watson and Crick describe DNA structure'),
      VaultEvent(year: 1973, label: 'Cohen and Boyer create first recombinant DNA'),
      VaultEvent(year: 1996, label: 'Dolly the sheep — first cloned mammal'),
      VaultEvent(year: 2003, label: 'Human Genome Project completed'),
    ],
  ),
  // ── ROUND 30 ──────────────────────────────────────────────
  VaultRound(
    id: 30, tier: 3,
    category: 'Trade & Silk Roads',
    timeLimitSecs: 46,
    events: [
      VaultEvent(year: -114, label: 'Han Dynasty opens the Silk Road'),
      VaultEvent(year: 900,  label: 'Viking traders reach Constantinople'),
      VaultEvent(year: 1271, label: 'Marco Polo travels the Silk Road'),
      VaultEvent(year: 1453, label: 'Silk Road disrupted by fall of Constantinople'),
      VaultEvent(year: 1498, label: 'Vasco da Gama finds sea route to India'),
      VaultEvent(year: 1869, label: 'Suez Canal opens'),
    ],
  ),
  // ── ROUND 31 ──────────────────────────────────────────────
  VaultRound(
    id: 31, tier: 3,
    category: 'Nuclear Age',
    timeLimitSecs: 45,
    events: [
      VaultEvent(year: 1938, label: 'Nuclear fission discovered by Hahn and Strassmann'),
      VaultEvent(year: 1942, label: 'Chicago Pile-1 — first nuclear reactor'),
      VaultEvent(year: 1945, label: 'Atomic bombs dropped on Hiroshima and Nagasaki'),
      VaultEvent(year: 1952, label: 'First hydrogen bomb tested by US'),
      VaultEvent(year: 1957, label: 'First commercial nuclear power station opens'),
      VaultEvent(year: 1986, label: 'Chernobyl nuclear disaster'),
    ],
  ),
  // ── ROUND 32 ──────────────────────────────────────────────
  VaultRound(
    id: 32, tier: 3,
    category: 'US History',
    timeLimitSecs: 45,
    events: [
      VaultEvent(year: 1776, label: 'Declaration of Independence signed'),
      VaultEvent(year: 1861, label: 'American Civil War begins'),
      VaultEvent(year: 1865, label: '13th Amendment abolishes slavery'),
      VaultEvent(year: 1929, label: 'Wall Street Crash — Great Depression'),
      VaultEvent(year: 1963, label: 'JFK assassinated in Dallas'),
      VaultEvent(year: 2001, label: '9/11 terrorist attacks on New York and DC'),
    ],
  ),
  // ── ROUND 33 ──────────────────────────────────────────────
  VaultRound(
    id: 33, tier: 3,
    category: 'Philosophy',
    timeLimitSecs: 45,
    events: [
      VaultEvent(year: -470, label: 'Socrates born in Athens'),
      VaultEvent(year: 1637, label: 'Descartes publishes Discourse on the Method'),
      VaultEvent(year: 1781, label: 'Kant publishes Critique of Pure Reason'),
      VaultEvent(year: 1807, label: 'Hegel publishes Phenomenology of Spirit'),
      VaultEvent(year: 1883, label: 'Nietzsche publishes Thus Spoke Zarathustra'),
      VaultEvent(year: 1943, label: 'Sartre publishes Being and Nothingness'),
    ],
  ),
  // ── ROUND 34 ──────────────────────────────────────────────
  VaultRound(
    id: 34, tier: 3,
    category: 'Sporting Legends',
    timeLimitSecs: 44,
    events: [
      VaultEvent(year: 1966, label: 'England wins FIFA World Cup at Wembley'),
      VaultEvent(year: 1970, label: 'Pelé wins his third World Cup in Mexico'),
      VaultEvent(year: 1974, label: 'Muhammad Ali vs Foreman — Rumble in the Jungle'),
      VaultEvent(year: 1986, label: '''Maradona's "Hand of God" and Goal of the Century'''),
      VaultEvent(year: 1996, label: 'Michael Jordan wins fourth NBA championship'),
      VaultEvent(year: 2008, label: 'Usain Bolt breaks 100m and 200m world records'),
    ],
  ),
  // ── ROUND 35 ──────────────────────────────────────────────
  VaultRound(
    id: 35, tier: 3,
    category: 'Digital Revolution',
    timeLimitSecs: 44,
    events: [
      VaultEvent(year: 1975, label: 'Microsoft founded by Gates and Allen'),
      VaultEvent(year: 1976, label: 'Apple founded by Jobs, Wozniak, and Wayne'),
      VaultEvent(year: 1991, label: 'World Wide Web becomes publicly available'),
      VaultEvent(year: 2004, label: 'Facebook launches at Harvard'),
      VaultEvent(year: 2008, label: 'App Store and Google Play launch'),
      VaultEvent(year: 2022, label: 'ChatGPT launches — AI goes mainstream'),
    ],
  ),
  // ── ROUND 36 ──────────────────────────────────────────────
  VaultRound(
    id: 36, tier: 4,
    category: 'Religion & Faith',
    timeLimitSecs: 43,
    events: [
      VaultEvent(year: -563, label: 'Siddhartha Gautama (the Buddha) born'),
      VaultEvent(year: 4,    label: 'Birth of Jesus of Nazareth'),
      VaultEvent(year: 570,  label: 'Prophet Muhammad born in Mecca'),
      VaultEvent(year: 1054, label: 'Great Schism splits Christianity'),
      VaultEvent(year: 1517, label: '''Luther's 95 Theses — Protestant Reformation'''),
      VaultEvent(year: 1962, label: 'Second Vatican Council opens'),
    ],
  ),
  // ── ROUND 37 ──────────────────────────────────────────────
  VaultRound(
    id: 37, tier: 4,
    category: 'Language & Writing',
    timeLimitSecs: 43,
    events: [
      VaultEvent(year: -3200, label: 'Sumerian cuneiform — first writing system'),
      VaultEvent(year: -1050, label: 'Phoenician alphabet developed'),
      VaultEvent(year: -200,  label: 'Rosetta Stone inscription created'),
      VaultEvent(year: 1440,  label: '''Gutenberg's press revolutionises literacy'''),
      VaultEvent(year: 1755,  label: 'Samuel Johnson publishes English Dictionary'),
      VaultEvent(year: 1828,  label: 'Webster publishes American Dictionary'),
    ],
  ),
  // ── ROUND 38 ──────────────────────────────────────────────
  VaultRound(
    id: 38, tier: 4,
    category: 'Rights & Justice',
    timeLimitSecs: 42,
    events: [
      VaultEvent(year: 1215, label: 'Magna Carta limits English royal power'),
      VaultEvent(year: 1789, label: 'Declaration of the Rights of Man'),
      VaultEvent(year: 1863, label: 'Emancipation Proclamation issued by Lincoln'),
      VaultEvent(year: 1948, label: 'Universal Declaration of Human Rights adopted'),
      VaultEvent(year: 1964, label: 'US Civil Rights Act signed'),
      VaultEvent(year: 1994, label: 'Nelson Mandela elected President of South Africa'),
    ],
  ),
  // ── ROUND 39 ──────────────────────────────────────────────
  VaultRound(
    id: 39, tier: 4,
    category: 'Middle East',
    timeLimitSecs: 42,
    events: [
      VaultEvent(year: -3500, label: 'Mesopotamian civilisation emerges'),
      VaultEvent(year: 1258, label: 'Mongols sack Baghdad — Abbasid Caliphate ends'),
      VaultEvent(year: 1517, label: 'Ottoman Empire conquers Egypt'),
      VaultEvent(year: 1948, label: 'State of Israel declared'),
      VaultEvent(year: 1973, label: 'OPEC oil embargo'),
      VaultEvent(year: 2011, label: 'Arab Spring protests sweep the region'),
    ],
  ),
  // ── ROUND 40 ──────────────────────────────────────────────
  VaultRound(
    id: 40, tier: 4,
    category: 'Aviation',
    timeLimitSecs: 42,
    events: [
      VaultEvent(year: 1783, label: 'Montgolfier brothers fly first hot air balloon'),
      VaultEvent(year: 1903, label: 'Wright brothers achieve powered flight'),
      VaultEvent(year: 1927, label: 'Lindbergh completes first solo Atlantic crossing'),
      VaultEvent(year: 1947, label: 'Chuck Yeager breaks the sound barrier'),
      VaultEvent(year: 1969, label: 'Concorde makes its maiden flight'),
      VaultEvent(year: 2004, label: 'SpaceShipOne — first private crewed spaceflight'),
    ],
  ),
  // ── ROUND 41 ──────────────────────────────────────────────
  VaultRound(
    id: 41, tier: 4,
    category: 'South & Southeast Asia',
    timeLimitSecs: 41,
    events: [
      VaultEvent(year: -322,  label: 'Chandragupta founds Maurya Empire in India'),
      VaultEvent(year: 800,   label: 'Khmer Empire emerges in Cambodia'),
      VaultEvent(year: 1206,  label: 'Delhi Sultanate established'),
      VaultEvent(year: 1858,  label: 'British Raj begins in India'),
      VaultEvent(year: 1947,  label: 'India and Pakistan gain independence'),
      VaultEvent(year: 1975,  label: 'Vietnam War ends with fall of Saigon'),
    ],
  ),
  // ── ROUND 42 ──────────────────────────────────────────────
  VaultRound(
    id: 42, tier: 4,
    category: 'Weapons & Warfare',
    timeLimitSecs: 41,
    events: [
      VaultEvent(year: -500,  label: 'Greek hoplite phalanx tactics developed'),
      VaultEvent(year: 850,   label: 'Gunpowder first used in warfare (China)'),
      VaultEvent(year: 1346,  label: 'Battle of Crécy — longbow vs knights'),
      VaultEvent(year: 1862,  label: 'Gatling gun patented'),
      VaultEvent(year: 1916,  label: 'First use of tanks in battle'),
      VaultEvent(year: 1945,  label: 'First nuclear weapon used in war'),
    ],
  ),
  // ── ROUND 43 ──────────────────────────────────────────────
  VaultRound(
    id: 43, tier: 4,
    category: 'Mathematics',
    timeLimitSecs: 40,
    events: [
      VaultEvent(year: -300, label: 'Euclid writes Elements — foundations of geometry'),
      VaultEvent(year: 830,  label: 'Al-Khwarizmi develops algebra'),
      VaultEvent(year: 1637, label: 'Fermat conjectures his Last Theorem'),
      VaultEvent(year: 1687, label: 'Newton publishes calculus in Principia Mathematica'),
      VaultEvent(year: 1931, label: 'Gödel publishes incompleteness theorems'),
      VaultEvent(year: 1994, label: '''Andrew Wiles proves Fermat's Last Theorem'''),
    ],
  ),
  // ── ROUND 44 ──────────────────────────────────────────────
  VaultRound(
    id: 44, tier: 4,
    category: 'Immigration & Migration',
    timeLimitSecs: 40,
    events: [
      VaultEvent(year: 1820, label: 'Mass European emigration to the Americas begins'),
      VaultEvent(year: 1845, label: 'Great Famine drives Irish emigration'),
      VaultEvent(year: 1882, label: 'Chinese Exclusion Act passed in the US'),
      VaultEvent(year: 1948, label: 'Windrush — Caribbean migrants arrive in UK'),
      VaultEvent(year: 1975, label: 'Vietnamese boat people flee after war'),
      VaultEvent(year: 2015, label: 'European refugee crisis peaks — 1M+ crossings'),
    ],
  ),
  // ── ROUND 45 ──────────────────────────────────────────────
  VaultRound(
    id: 45, tier: 4,
    category: 'East Asia Modern',
    timeLimitSecs: 40,
    events: [
      VaultEvent(year: 1853, label: '''Perry's Black Ships force open Japan'''),
      VaultEvent(year: 1905, label: 'Japan defeats Russia in Russo-Japanese War'),
      VaultEvent(year: 1937, label: 'Japan invades China — Second Sino-Japanese War'),
      VaultEvent(year: 1950, label: 'Korean War divides the peninsula'),
      VaultEvent(year: 1978, label: 'Deng Xiaoping begins China\'s reform and opening'),
      VaultEvent(year: 1997, label: 'Hong Kong returned to China by Britain'),
    ],
  ),
  // ── ROUND 46 ──────────────────────────────────────────────
  VaultRound(
    id: 46, tier: 4,
    category: 'Food & Agriculture',
    timeLimitSecs: 38,
    events: [
      VaultEvent(year: -10000, label: 'Agricultural revolution begins in Fertile Crescent'),
      VaultEvent(year: -4000,  label: 'Fermentation used to make beer and wine'),
      VaultEvent(year: 1492,   label: 'Columbian Exchange brings new foods to Europe'),
      VaultEvent(year: 1798,   label: 'Malthus warns of population vs food supply'),
      VaultEvent(year: 1970,   label: 'Green Revolution — Norman Borlaug wins Nobel'),
      VaultEvent(year: 1994,   label: 'First genetically modified food approved (Flavr Savr tomato)'),
    ],
  ),
  // ── ROUND 47 ──────────────────────────────────────────────
  VaultRound(
    id: 47, tier: 4,
    category: 'Famous Battles',
    timeLimitSecs: 38,
    events: [
      VaultEvent(year: -480, label: 'Battle of Thermopylae — 300 Spartans hold'),
      VaultEvent(year: 1066, label: 'Battle of Hastings'),
      VaultEvent(year: 1415, label: 'Battle of Agincourt'),
      VaultEvent(year: 1815, label: 'Battle of Waterloo ends Napoleonic Wars'),
      VaultEvent(year: 1916, label: 'Battle of the Somme — 1 million casualties'),
      VaultEvent(year: 1942, label: 'Battle of Stalingrad — turning point of WWII'),
    ],
  ),
  // ── ROUND 48 ──────────────────────────────────────────────
  VaultRound(
    id: 48, tier: 4,
    category: 'Communication',
    timeLimitSecs: 37,
    events: [
      VaultEvent(year: 1450, label: 'Printing press spreads literacy in Europe'),
      VaultEvent(year: 1837, label: 'Morse code telegraph patented'),
      VaultEvent(year: 1876, label: 'Bell patents the telephone'),
      VaultEvent(year: 1895, label: 'Marconi sends first radio signal'),
      VaultEvent(year: 1969, label: 'First email sent on ARPANET'),
      VaultEvent(year: 2007, label: 'Twitter surpasses 1 million users'),
    ],
  ),
  // ── ROUND 49 ──────────────────────────────────────────────
  VaultRound(
    id: 49, tier: 4,
    category: 'World Leaders',
    timeLimitSecs: 36,
    events: [
      VaultEvent(year: -44,  label: 'Assassination of Julius Caesar'),
      VaultEvent(year: 1799, label: 'Napoleon Bonaparte seizes power in France'),
      VaultEvent(year: 1933, label: 'Hitler appointed Chancellor of Germany'),
      VaultEvent(year: 1945, label: 'Churchill, Roosevelt, and Stalin meet at Yalta'),
      VaultEvent(year: 1991, label: 'Gorbachev resigns — USSR dissolved'),
      VaultEvent(year: 2008, label: 'Barack Obama elected first Black US President'),
    ],
  ),
  // ── ROUND 50 ──────────────────────────────────────────────
  VaultRound(
    id: 50, tier: 4,
    category: 'The Grand Vault',
    timeLimitSecs: 35,
    events: [
      VaultEvent(year: -3200, label: 'Writing invented in Mesopotamia'),
      VaultEvent(year: 1 ,    label: 'Birth of the Common Era'),
      VaultEvent(year: 1440,  label: 'Gutenberg printing press'),
      VaultEvent(year: 1776,  label: 'American Declaration of Independence'),
      VaultEvent(year: 1969,  label: 'Humans walk on the Moon'),
      VaultEvent(year: 2024,  label: 'AI reshapes science, art, and society'),
    ],
  ),
];
