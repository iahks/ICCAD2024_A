// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Tue Aug 13 23:04:01 2024

module top_809960632_810038711_1598227639_893650103 ( 
    n2, n4, n12, n18, n22, n34, n35, n51, n57, n67, n72, n75, n78, n80,
    n6, n9, n42, n48, n56, n65, n68, n77  );
  input  n2, n4, n12, n18, n22, n34, n35, n51, n57, n67, n72, n75, n78,
    n80;
  output n6, n9, n42, n48, n56, n65, n68, n77;
  wire new_n23, new_n24, new_n25, new_n26, new_n27, new_n28, new_n29,
    new_n30, new_n31, new_n32, new_n33, new_n34_1, new_n35_1, new_n36,
    new_n37, new_n39, new_n40, new_n41, new_n42_1, new_n43, new_n44,
    new_n45, new_n46, new_n47, new_n48_1, new_n49, new_n50, new_n51_1,
    new_n52, new_n53, new_n54, new_n55, new_n56_1, new_n57_1, new_n58,
    new_n59, new_n60, new_n61, new_n62, new_n63, new_n64, new_n66,
    new_n67_1, new_n68_1, new_n69, new_n71, new_n72_1, new_n73, new_n74,
    new_n75_1, new_n76, new_n77_1, new_n78_1, new_n79, new_n80_1, new_n81,
    new_n82, new_n83, new_n84, new_n85, new_n87, new_n88, new_n89, new_n90,
    new_n92, new_n93, new_n95, new_n96, new_n97, new_n99;
  not_8  g00(.A(n12), .Y(new_n23));
  nand_5 g01(.A(n51), .B(new_n23), .Y(new_n24));
  not_8  g02(.A(n67), .Y(new_n25));
  nor_5  g03(.A(n78), .B(new_n25), .Y(new_n26));
  or_5   g04(.A(n80), .B(n67), .Y(new_n27));
  nand_5 g05(.A(new_n27), .B(n22), .Y(new_n28));
  nor_5  g06(.A(new_n28), .B(new_n26), .Y(new_n29));
  not_8  g07(.A(new_n29), .Y(new_n30));
  nand_5 g08(.A(n72), .B(n67), .Y(new_n31));
  not_8  g09(.A(n75), .Y(new_n32));
  nor_5  g10(.A(new_n32), .B(n67), .Y(new_n33));
  nor_5  g11(.A(new_n33), .B(n22), .Y(new_n34_1));
  nand_5 g12(.A(new_n34_1), .B(new_n31), .Y(new_n35_1));
  xor_4  g13(.A(new_n35_1), .B(new_n30), .Y(new_n36));
  xor_4  g14(.A(new_n36), .B(new_n24), .Y(new_n37));
  not_8  g15(.A(new_n37), .Y(n6));
  nand_5 g16(.A(new_n30), .B(n51), .Y(new_n39));
  not_8  g17(.A(n2), .Y(new_n40));
  nor_5  g18(.A(n78), .B(new_n40), .Y(new_n41));
  or_5   g19(.A(n80), .B(n2), .Y(new_n42_1));
  nand_5 g20(.A(new_n42_1), .B(n18), .Y(new_n43));
  nor_5  g21(.A(new_n43), .B(new_n41), .Y(new_n44));
  or_5   g22(.A(new_n44), .B(new_n39), .Y(new_n45));
  nand_5 g23(.A(n72), .B(n2), .Y(new_n46));
  nor_5  g24(.A(new_n32), .B(n2), .Y(new_n47));
  nor_5  g25(.A(new_n47), .B(n18), .Y(new_n48_1));
  and_5  g26(.A(new_n48_1), .B(new_n46), .Y(new_n49));
  nor_5  g27(.A(new_n44), .B(new_n35_1), .Y(new_n50));
  nor_5  g28(.A(new_n50), .B(new_n49), .Y(new_n51_1));
  and_5  g29(.A(new_n51_1), .B(new_n45), .Y(new_n52));
  nor_5  g30(.A(new_n52), .B(n12), .Y(new_n53));
  not_8  g31(.A(n57), .Y(new_n54));
  nor_5  g32(.A(n78), .B(new_n54), .Y(new_n55));
  or_5   g33(.A(n80), .B(n57), .Y(new_n56_1));
  nand_5 g34(.A(new_n56_1), .B(n34), .Y(new_n57_1));
  nor_5  g35(.A(new_n57_1), .B(new_n55), .Y(new_n58));
  nand_5 g36(.A(n72), .B(n57), .Y(new_n59));
  nor_5  g37(.A(new_n32), .B(n57), .Y(new_n60));
  nor_5  g38(.A(new_n60), .B(n34), .Y(new_n61));
  nand_5 g39(.A(new_n61), .B(new_n59), .Y(new_n62));
  not_8  g40(.A(new_n62), .Y(new_n63));
  xor_4  g41(.A(new_n63), .B(new_n58), .Y(new_n64));
  xor_4  g42(.A(new_n64), .B(new_n53), .Y(n9));
  nand_5 g43(.A(new_n39), .B(new_n35_1), .Y(new_n66));
  nand_5 g44(.A(new_n66), .B(new_n23), .Y(new_n67_1));
  xor_4  g45(.A(new_n49), .B(new_n44), .Y(new_n68_1));
  xor_4  g46(.A(new_n68_1), .B(new_n67_1), .Y(new_n69));
  not_8  g47(.A(new_n69), .Y(n42));
  nand_5 g48(.A(n72), .B(n4), .Y(new_n71));
  not_8  g49(.A(new_n71), .Y(new_n72_1));
  not_8  g50(.A(n35), .Y(new_n73));
  not_8  g51(.A(n4), .Y(new_n74));
  nand_5 g52(.A(n75), .B(new_n74), .Y(new_n75_1));
  nand_5 g53(.A(new_n75_1), .B(new_n73), .Y(new_n76));
  nor_5  g54(.A(new_n76), .B(new_n72_1), .Y(new_n77_1));
  nor_5  g55(.A(n78), .B(new_n74), .Y(new_n78_1));
  nor_5  g56(.A(n80), .B(n4), .Y(new_n79));
  nor_5  g57(.A(new_n79), .B(new_n73), .Y(new_n80_1));
  not_8  g58(.A(new_n80_1), .Y(new_n81));
  nor_5  g59(.A(new_n81), .B(new_n78_1), .Y(new_n82));
  nor_5  g60(.A(new_n58), .B(new_n51_1), .Y(new_n83));
  nor_5  g61(.A(new_n83), .B(new_n63), .Y(new_n84));
  nor_5  g62(.A(new_n84), .B(new_n82), .Y(new_n85));
  nor_5  g63(.A(new_n85), .B(new_n77_1), .Y(n48));
  or_5   g64(.A(new_n58), .B(new_n45), .Y(new_n87));
  and_5  g65(.A(new_n87), .B(new_n84), .Y(new_n88));
  nor_5  g66(.A(new_n88), .B(n12), .Y(new_n89));
  xor_4  g67(.A(new_n82), .B(new_n77_1), .Y(new_n90));
  xor_4  g68(.A(new_n90), .B(new_n89), .Y(n65));
  nor_5  g69(.A(new_n69), .B(new_n37), .Y(new_n92));
  and_5  g70(.A(new_n92), .B(n9), .Y(new_n93));
  and_5  g71(.A(new_n93), .B(n65), .Y(n56));
  not_8  g72(.A(n51), .Y(new_n95));
  nor_5  g73(.A(new_n44), .B(new_n29), .Y(new_n96));
  nor_5  g74(.A(new_n82), .B(new_n58), .Y(new_n97));
  nand_5 g75(.A(new_n97), .B(new_n96), .Y(n77));
  or_5   g76(.A(n77), .B(new_n95), .Y(new_n99));
  nand_5 g77(.A(new_n99), .B(n48), .Y(n68));
endmodule


