// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Sat Aug 17 23:20:27 2024

module top_809960632_810038711_1598227639_893650103 ( 
    n2, n4, n12, n18, n22, n34, n35, n51, n57, n67, n72, n75, n78, n80,
    n6, n9, n42, n48, n56, n65, n68, n77  );
  input  n2, n4, n12, n18, n22, n34, n35, n51, n57, n67, n72, n75, n78,
    n80;
  output n6, n9, n42, n48, n56, n65, n68, n77;
  wire new_n23, new_n24, new_n25, new_n26, new_n27, new_n28, new_n29,
    new_n30, new_n31, new_n32, new_n33, new_n34_1, new_n35_1, new_n36,
    new_n37, new_n38, new_n39, new_n41, new_n42_1, new_n43, new_n44,
    new_n45, new_n46, new_n47, new_n48_1, new_n49, new_n50, new_n51_1,
    new_n52, new_n53, new_n54, new_n55, new_n56_1, new_n57_1, new_n58,
    new_n59, new_n60, new_n61, new_n62, new_n63, new_n64, new_n65_1,
    new_n66, new_n67_1, new_n68_1, new_n70, new_n71, new_n72_1, new_n73,
    new_n75_1, new_n76, new_n77_1, new_n78_1, new_n79, new_n80_1, new_n81,
    new_n82, new_n83, new_n84, new_n85, new_n86, new_n87, new_n89, new_n90,
    new_n91, new_n92, new_n93, new_n94, new_n95, new_n96, new_n97,
    new_n100, new_n101, new_n102;
  nand g00 ( new_n23 , n12 , n12 );
  nand    g01 ( new_n24 , new_n23 , n51 );
  nand g02 ( new_n25 , new_n24 , new_n24 );
  nand g03 ( new_n26 , n78 , n78 );
  nand    g04 ( new_n27 , n67 , new_n26 );
  nand g05 ( new_n28 , n22 , n22 );
  nor     g06 ( new_n29 , n67 , n80 );
  nor     g07 ( new_n30 , new_n28 , new_n29 );
  nand    g08 ( new_n31 , new_n27 , new_n30 );
  nand g09 ( new_n32 , n75 , n75 );
  nor     g10 ( new_n33 , n67 , new_n32 );
  nand    g11 ( new_n34_1 , n67 , n72 );
  nand    g12 ( new_n35_1 , new_n28 , new_n34_1 );
  nor     g13 ( new_n36 , new_n33 , new_n35_1 );
  nand g14 ( new_n37 , new_n36 , new_n36 );
  nand    g15 ( new_n38 , new_n31 , new_n37 );
  xnor    g16 ( new_n39 , new_n25 , new_n38 );
  nand g17 ( n6 , new_n39 , new_n39 );
  nor     g18 ( new_n41 , n2 , new_n32 );
  nand g19 ( new_n42_1 , n18 , n18 );
  nand    g20 ( new_n43 , n2 , n72 );
  nand    g21 ( new_n44 , new_n42_1 , new_n43 );
  nor     g22 ( new_n45 , new_n41 , new_n44 );
  nand g23 ( new_n46 , new_n45 , new_n45 );
  nand    g24 ( new_n47 , n2 , new_n26 );
  nor     g25 ( new_n48_1 , n2 , n80 );
  nor     g26 ( new_n49 , new_n42_1 , new_n48_1 );
  nand    g27 ( new_n50 , new_n47 , new_n49 );
  nand    g28 ( new_n51_1 , new_n36 , new_n50 );
  nand    g29 ( new_n52 , new_n46 , new_n51_1 );
  nand    g30 ( new_n53 , n18 , new_n47 );
  nor     g31 ( new_n54 , new_n48_1 , new_n53 );
  nand    g32 ( new_n55 , n51 , new_n31 );
  nor     g33 ( new_n56_1 , new_n54 , new_n55 );
  nor     g34 ( new_n57_1 , new_n52 , new_n56_1 );
  nor     g35 ( new_n58 , n12 , new_n57_1 );
  nor     g36 ( new_n59 , n57 , new_n32 );
  nand g37 ( new_n60 , n34 , n34 );
  nand    g38 ( new_n61 , n57 , n72 );
  nand    g39 ( new_n62 , new_n60 , new_n61 );
  nor     g40 ( new_n63 , new_n59 , new_n62 );
  nor     g41 ( new_n64 , n57 , n80 );
  nand    g42 ( new_n65_1 , n57 , new_n26 );
  nand    g43 ( new_n66 , n34 , new_n65_1 );
  nor     g44 ( new_n67_1 , new_n64 , new_n66 );
  nor     g45 ( new_n68_1 , new_n63 , new_n67_1 );
  xnor    g46 ( n9 , new_n58 , new_n68_1 );
  nand    g47 ( new_n70 , new_n37 , new_n55 );
  nand    g48 ( new_n71 , new_n23 , new_n70 );
  nor     g49 ( new_n72_1 , new_n54 , new_n45 );
  xnor    g50 ( new_n73 , new_n71 , new_n72_1 );
  nand g51 ( n42 , new_n73 , new_n73 );
  nor     g52 ( new_n75_1 , n4 , new_n32 );
  nand g53 ( new_n76 , n35 , n35 );
  nand    g54 ( new_n77_1 , n4 , n72 );
  nand    g55 ( new_n78_1 , new_n76 , new_n77_1 );
  nor     g56 ( new_n79 , new_n75_1 , new_n78_1 );
  nor     g57 ( new_n80_1 , new_n52 , new_n63 );
  nand g58 ( new_n81 , new_n67_1 , new_n67_1 );
  nand    g59 ( new_n82 , n4 , new_n26 );
  nor     g60 ( new_n83 , n4 , n80 );
  nor     g61 ( new_n84 , new_n76 , new_n83 );
  nand    g62 ( new_n85 , new_n82 , new_n84 );
  nand    g63 ( new_n86 , new_n81 , new_n85 );
  nor     g64 ( new_n87 , new_n80_1 , new_n86 );
  nor     g65 ( n48 , new_n79 , new_n87 );
  nand g66 ( new_n89 , new_n63 , new_n63 );
  nand    g67 ( new_n90 , new_n57_1 , new_n89 );
  nor     g68 ( new_n91 , n12 , new_n67_1 );
  nand    g69 ( new_n92 , new_n90 , new_n91 );
  nand g70 ( new_n93 , new_n85 , new_n85 );
  nor     g71 ( new_n94 , new_n93 , new_n79 );
  xnor    g72 ( new_n95 , new_n92 , new_n94 );
  nor     g73 ( new_n96 , new_n39 , new_n73 );
  nand    g74 ( new_n97 , n9 , new_n96 );
  nor     g75 ( n56 , new_n95 , new_n97 );
  nand g76 ( n65 , new_n95 , new_n95 );
  nand    g77 ( new_n100 , new_n31 , new_n50 );
  nor     g78 ( new_n101 , new_n100 , new_n86 );
  nand    g79 ( new_n102 , n51 , new_n101 );
  nand    g80 ( n68 , n48 , new_n102 );
  nand g81 ( n77 , new_n101 , new_n101 );
endmodule


