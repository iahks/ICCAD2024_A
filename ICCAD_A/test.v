// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Tue Aug 13 23:08:23 2024

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
    new_n82, new_n84, new_n85, new_n86, new_n87, new_n89, new_n90, new_n92,
    new_n93;
  not_8  g00(.A(n51), .Y(new_n23));
  nor_5  g01(.A(new_n23), .B(n12), .Y(new_n24));
  not_8  g02(.A(n78), .Y(new_n25));
  nand_5 g03(.A(new_n25), .B(n67), .Y(new_n26));
  not_8  g04(.A(n22), .Y(new_n27));
  nor_5  g05(.A(n80), .B(n67), .Y(new_n28));
  nor_5  g06(.A(new_n28), .B(new_n27), .Y(new_n29));
  and_5  g07(.A(new_n29), .B(new_n26), .Y(new_n30));
  not_8  g08(.A(n75), .Y(new_n31));
  nor_5  g09(.A(new_n31), .B(n67), .Y(new_n32));
  nand_5 g10(.A(n72), .B(n67), .Y(new_n33));
  nand_5 g11(.A(new_n33), .B(new_n27), .Y(new_n34_1));
  nor_5  g12(.A(new_n34_1), .B(new_n32), .Y(new_n35_1));
  nor_5  g13(.A(new_n35_1), .B(new_n30), .Y(new_n36));
  xor_4  g14(.A(new_n36), .B(new_n24), .Y(new_n37));
  not_8  g15(.A(new_n37), .Y(n6));
  not_8  g16(.A(n12), .Y(new_n39));
  nand_5 g17(.A(new_n25), .B(n2), .Y(new_n40));
  not_8  g18(.A(n18), .Y(new_n41));
  nor_5  g19(.A(n80), .B(n2), .Y(new_n42_1));
  nor_5  g20(.A(new_n42_1), .B(new_n41), .Y(new_n43));
  and_5  g21(.A(new_n43), .B(new_n40), .Y(new_n44));
  nor_5  g22(.A(new_n31), .B(n2), .Y(new_n45));
  nand_5 g23(.A(n72), .B(n2), .Y(new_n46));
  nand_5 g24(.A(new_n46), .B(new_n41), .Y(new_n47));
  nor_5  g25(.A(new_n47), .B(new_n45), .Y(new_n48_1));
  nor_5  g26(.A(new_n48_1), .B(new_n35_1), .Y(new_n49));
  nor_5  g27(.A(new_n49), .B(new_n44), .Y(new_n50));
  or_5   g28(.A(new_n44), .B(new_n30), .Y(new_n51_1));
  nor_5  g29(.A(new_n51_1), .B(new_n23), .Y(new_n52));
  or_5   g30(.A(new_n52), .B(new_n50), .Y(new_n53));
  nand_5 g31(.A(new_n53), .B(new_n39), .Y(new_n54));
  nor_5  g32(.A(new_n31), .B(n57), .Y(new_n55));
  not_8  g33(.A(n34), .Y(new_n56_1));
  nand_5 g34(.A(n72), .B(n57), .Y(new_n57_1));
  nand_5 g35(.A(new_n57_1), .B(new_n56_1), .Y(new_n58));
  nor_5  g36(.A(new_n58), .B(new_n55), .Y(new_n59));
  and_5  g37(.A(new_n25), .B(n57), .Y(new_n60));
  nor_5  g38(.A(n80), .B(n57), .Y(new_n61));
  or_5   g39(.A(new_n61), .B(new_n56_1), .Y(new_n62));
  nor_5  g40(.A(new_n62), .B(new_n60), .Y(new_n63));
  nor_5  g41(.A(new_n63), .B(new_n59), .Y(new_n64));
  xor_4  g42(.A(new_n64), .B(new_n54), .Y(n9));
  nor_5  g43(.A(new_n30), .B(new_n23), .Y(new_n66));
  nor_5  g44(.A(new_n66), .B(new_n35_1), .Y(new_n67_1));
  or_5   g45(.A(new_n67_1), .B(n12), .Y(new_n68_1));
  nor_5  g46(.A(new_n48_1), .B(new_n44), .Y(new_n69));
  xor_4  g47(.A(new_n69), .B(new_n68_1), .Y(n42));
  nor_5  g48(.A(new_n31), .B(n4), .Y(new_n71));
  not_8  g49(.A(n35), .Y(new_n72_1));
  nand_5 g50(.A(n72), .B(n4), .Y(new_n73));
  nand_5 g51(.A(new_n73), .B(new_n72_1), .Y(new_n74));
  nor_5  g52(.A(new_n74), .B(new_n71), .Y(new_n75_1));
  nor_5  g53(.A(new_n59), .B(new_n50), .Y(new_n76));
  and_5  g54(.A(new_n25), .B(n4), .Y(new_n77_1));
  nor_5  g55(.A(n80), .B(n4), .Y(new_n78_1));
  or_5   g56(.A(new_n78_1), .B(new_n72_1), .Y(new_n79));
  nor_5  g57(.A(new_n79), .B(new_n77_1), .Y(new_n80_1));
  or_5   g58(.A(new_n80_1), .B(new_n63), .Y(new_n81));
  nor_5  g59(.A(new_n81), .B(new_n76), .Y(new_n82));
  nor_5  g60(.A(new_n82), .B(new_n75_1), .Y(n48));
  nor_5  g61(.A(new_n59), .B(new_n53), .Y(new_n84));
  or_5   g62(.A(new_n63), .B(n12), .Y(new_n85));
  or_5   g63(.A(new_n85), .B(new_n84), .Y(new_n86));
  nor_5  g64(.A(new_n75_1), .B(new_n80_1), .Y(new_n87));
  xor_4  g65(.A(new_n87), .B(new_n86), .Y(n65));
  and_5  g66(.A(n42), .B(n6), .Y(new_n89));
  and_5  g67(.A(new_n89), .B(n9), .Y(new_n90));
  and_5  g68(.A(new_n90), .B(n65), .Y(n56));
  nor_5  g69(.A(new_n81), .B(new_n51_1), .Y(new_n92));
  nand_5 g70(.A(new_n92), .B(n51), .Y(new_n93));
  nand_5 g71(.A(new_n93), .B(n48), .Y(n68));
  not_8  g72(.A(new_n92), .Y(n77));
endmodule


