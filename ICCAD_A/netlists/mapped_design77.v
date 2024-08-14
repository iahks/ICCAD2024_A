// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Tue Aug 13 23:04:01 2024

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
    new_n66, new_n67_1, new_n69, new_n70, new_n71, new_n72_1, new_n73,
    new_n75_1, new_n76, new_n77_1, new_n78_1, new_n79, new_n80_1, new_n81,
    new_n82, new_n83, new_n84, new_n85, new_n86, new_n87, new_n88, new_n89,
    new_n90, new_n91, new_n93, new_n94, new_n95, new_n96, new_n97, new_n98,
    new_n99, new_n100, new_n101, new_n102, new_n105, new_n106, new_n107,
    new_n108;
  not_8  g00(.A(n12), .Y(new_n23));
  nand_5 g01(.A(n51), .B(new_n23), .Y(new_n24));
  not_8  g02(.A(n78), .Y(new_n25));
  nand_5 g03(.A(new_n25), .B(n67), .Y(new_n26));
  not_8  g04(.A(n22), .Y(new_n27));
  nor_5  g05(.A(n80), .B(n67), .Y(new_n28));
  nor_5  g06(.A(new_n28), .B(new_n27), .Y(new_n29));
  nand_5 g07(.A(new_n29), .B(new_n26), .Y(new_n30));
  not_8  g08(.A(new_n30), .Y(new_n31));
  nand_5 g09(.A(n72), .B(n67), .Y(new_n32));
  not_8  g10(.A(new_n32), .Y(new_n33));
  not_8  g11(.A(n67), .Y(new_n34_1));
  nand_5 g12(.A(n75), .B(new_n34_1), .Y(new_n35_1));
  nand_5 g13(.A(new_n35_1), .B(new_n27), .Y(new_n36));
  nor_5  g14(.A(new_n36), .B(new_n33), .Y(new_n37));
  xnor_4 g15(.A(new_n37), .B(new_n31), .Y(new_n38));
  xnor_4 g16(.A(new_n38), .B(new_n24), .Y(new_n39));
  not_8  g17(.A(new_n39), .Y(n6));
  nand_5 g18(.A(new_n30), .B(n51), .Y(new_n41));
  nand_5 g19(.A(new_n25), .B(n2), .Y(new_n42_1));
  not_8  g20(.A(n18), .Y(new_n43));
  nor_5  g21(.A(n80), .B(n2), .Y(new_n44));
  nor_5  g22(.A(new_n44), .B(new_n43), .Y(new_n45));
  nand_5 g23(.A(new_n45), .B(new_n42_1), .Y(new_n46));
  not_8  g24(.A(new_n46), .Y(new_n47));
  nor_5  g25(.A(new_n47), .B(new_n41), .Y(new_n48_1));
  nand_5 g26(.A(n72), .B(n2), .Y(new_n49));
  not_8  g27(.A(n75), .Y(new_n50));
  nor_5  g28(.A(new_n50), .B(n2), .Y(new_n51_1));
  nor_5  g29(.A(new_n51_1), .B(n18), .Y(new_n52));
  nand_5 g30(.A(new_n52), .B(new_n49), .Y(new_n53));
  nand_5 g31(.A(new_n46), .B(new_n37), .Y(new_n54));
  nand_5 g32(.A(new_n54), .B(new_n53), .Y(new_n55));
  nor_5  g33(.A(new_n55), .B(new_n48_1), .Y(new_n56_1));
  nor_5  g34(.A(new_n56_1), .B(n12), .Y(new_n57_1));
  nand_5 g35(.A(new_n25), .B(n57), .Y(new_n58));
  not_8  g36(.A(n34), .Y(new_n59));
  nor_5  g37(.A(n80), .B(n57), .Y(new_n60));
  nor_5  g38(.A(new_n60), .B(new_n59), .Y(new_n61));
  nand_5 g39(.A(new_n61), .B(new_n58), .Y(new_n62));
  nand_5 g40(.A(n72), .B(n57), .Y(new_n63));
  nor_5  g41(.A(new_n50), .B(n57), .Y(new_n64));
  nor_5  g42(.A(new_n64), .B(n34), .Y(new_n65_1));
  nand_5 g43(.A(new_n65_1), .B(new_n63), .Y(new_n66));
  xnor_4 g44(.A(new_n66), .B(new_n62), .Y(new_n67_1));
  xnor_4 g45(.A(new_n67_1), .B(new_n57_1), .Y(n9));
  not_8  g46(.A(new_n37), .Y(new_n69));
  nand_5 g47(.A(new_n41), .B(new_n69), .Y(new_n70));
  nand_5 g48(.A(new_n70), .B(new_n23), .Y(new_n71));
  xnor_4 g49(.A(new_n53), .B(new_n46), .Y(new_n72_1));
  xnor_4 g50(.A(new_n72_1), .B(new_n71), .Y(new_n73));
  not_8  g51(.A(new_n73), .Y(n42));
  nand_5 g52(.A(n72), .B(n4), .Y(new_n75_1));
  not_8  g53(.A(n35), .Y(new_n76));
  not_8  g54(.A(n4), .Y(new_n77_1));
  nand_5 g55(.A(n75), .B(new_n77_1), .Y(new_n78_1));
  nand_5 g56(.A(new_n78_1), .B(new_n76), .Y(new_n79));
  not_8  g57(.A(new_n79), .Y(new_n80_1));
  nand_5 g58(.A(new_n80_1), .B(new_n75_1), .Y(new_n81));
  nand_5 g59(.A(new_n25), .B(n4), .Y(new_n82));
  not_8  g60(.A(n80), .Y(new_n83));
  nand_5 g61(.A(new_n83), .B(new_n77_1), .Y(new_n84));
  nand_5 g62(.A(new_n84), .B(n35), .Y(new_n85));
  not_8  g63(.A(new_n85), .Y(new_n86));
  nand_5 g64(.A(new_n86), .B(new_n82), .Y(new_n87));
  nand_5 g65(.A(new_n62), .B(new_n55), .Y(new_n88));
  nand_5 g66(.A(new_n88), .B(new_n66), .Y(new_n89));
  nand_5 g67(.A(new_n89), .B(new_n87), .Y(new_n90));
  nand_5 g68(.A(new_n90), .B(new_n81), .Y(new_n91));
  not_8  g69(.A(new_n91), .Y(n48));
  not_8  g70(.A(new_n48_1), .Y(new_n93));
  not_8  g71(.A(new_n62), .Y(new_n94));
  nor_5  g72(.A(new_n94), .B(new_n93), .Y(new_n95));
  nor_5  g73(.A(new_n95), .B(new_n89), .Y(new_n96));
  nor_5  g74(.A(new_n96), .B(n12), .Y(new_n97));
  xnor_4 g75(.A(new_n87), .B(new_n81), .Y(new_n98));
  not_8  g76(.A(new_n98), .Y(new_n99));
  xnor_4 g77(.A(new_n99), .B(new_n97), .Y(new_n100));
  nor_5  g78(.A(new_n73), .B(new_n39), .Y(new_n101));
  nand_5 g79(.A(new_n101), .B(n9), .Y(new_n102));
  nor_5  g80(.A(new_n102), .B(new_n100), .Y(n56));
  not_8  g81(.A(new_n100), .Y(n65));
  nand_5 g82(.A(new_n46), .B(new_n30), .Y(new_n105));
  nand_5 g83(.A(new_n87), .B(new_n62), .Y(new_n106));
  nor_5  g84(.A(new_n106), .B(new_n105), .Y(new_n107));
  nand_5 g85(.A(new_n107), .B(n51), .Y(new_n108));
  nand_5 g86(.A(new_n108), .B(n48), .Y(n68));
  not_8  g87(.A(new_n107), .Y(n77));
endmodule


