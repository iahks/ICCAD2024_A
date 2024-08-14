// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Wed Aug 14 20:45:38 2024

module top_809960632_810038711_1598227639_893650103 ( 
    pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, pi10, pi11,
    pi12, pi13,
    po0, po1, po2, po3, po4, po5, po6, po7  );
  input  pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09,
    pi10, pi11, pi12, pi13;
  output po0, po1, po2, po3, po4, po5, po6, po7;
  wire new_n23, new_n24, new_n25, new_n26, new_n27, new_n28, new_n29,
    new_n30, new_n31, new_n32, new_n33, new_n34, new_n36, new_n37, new_n38,
    new_n39, new_n40, new_n41, new_n42, new_n43, new_n44, new_n45, new_n46,
    new_n47, new_n48, new_n49, new_n50, new_n51, new_n52, new_n53, new_n54,
    new_n55, new_n56, new_n57, new_n58, new_n59, new_n60, new_n61, new_n64,
    new_n65, new_n66, new_n67, new_n68, new_n69, new_n70, new_n71, new_n72,
    new_n73, new_n74, new_n75, new_n76, new_n77, new_n79, new_n80, new_n81,
    new_n82, new_n84, new_n85, new_n87, new_n88, new_n89;
  not_11 g00(.A(pi02), .Y(new_n23));
  and_5  g01(.A(pi07), .B(new_n23), .Y(new_n24));
  not_11 g02(.A(pi09), .Y(new_n25));
  and_5  g03(.A(pi11), .B(new_n25), .Y(new_n26));
  and_5  g04(.A(pi10), .B(pi09), .Y(new_n27));
  or_3   g05(.A(new_n27), .B(pi04), .Y(new_n28));
  or_3   g06(.A(new_n28), .B(new_n26), .Y(new_n29));
  or_3   g07(.A(pi12), .B(new_n25), .Y(new_n30));
  or_3   g08(.A(pi13), .B(pi09), .Y(new_n31));
  and_5  g09(.A(new_n31), .B(pi04), .Y(new_n32));
  nand_7 g10(.A(new_n32), .B(new_n30), .Y(new_n33));
  nand_7 g11(.A(new_n33), .B(new_n29), .Y(new_n34));
  xor_1  g12(.A(new_n34), .B(new_n24), .Y(po0));
  not_11 g13(.A(pi08), .Y(new_n36));
  or_3   g14(.A(pi12), .B(new_n36), .Y(new_n37));
  or_3   g15(.A(pi13), .B(pi08), .Y(new_n38));
  and_5  g16(.A(new_n38), .B(pi05), .Y(new_n39));
  nand_7 g17(.A(new_n39), .B(new_n37), .Y(new_n40));
  and_5  g18(.A(pi11), .B(new_n36), .Y(new_n41));
  and_5  g19(.A(pi10), .B(pi08), .Y(new_n42));
  or_3   g20(.A(new_n42), .B(pi05), .Y(new_n43));
  or_3   g21(.A(new_n43), .B(new_n41), .Y(new_n44));
  and_5  g22(.A(new_n44), .B(new_n40), .Y(new_n45));
  not_11 g23(.A(pi00), .Y(new_n46));
  or_3   g24(.A(pi12), .B(new_n46), .Y(new_n47));
  or_3   g25(.A(pi13), .B(pi00), .Y(new_n48));
  and_5  g26(.A(new_n48), .B(pi03), .Y(new_n49));
  nand_7 g27(.A(new_n49), .B(new_n47), .Y(new_n50));
  and_5  g28(.A(pi11), .B(new_n46), .Y(new_n51));
  and_5  g29(.A(pi10), .B(pi00), .Y(new_n52));
  or_3   g30(.A(new_n52), .B(pi03), .Y(new_n53));
  or_3   g31(.A(new_n53), .B(new_n51), .Y(new_n54));
  and_5  g32(.A(new_n54), .B(new_n50), .Y(new_n55));
  or_3   g33(.A(new_n34), .B(new_n24), .Y(new_n56));
  and_5  g34(.A(new_n33), .B(new_n23), .Y(new_n57));
  nand_7 g35(.A(new_n57), .B(new_n56), .Y(new_n58));
  and_5  g36(.A(new_n58), .B(new_n55), .Y(new_n59));
  nand_7 g37(.A(new_n50), .B(new_n23), .Y(new_n60));
  or_3   g38(.A(new_n60), .B(new_n59), .Y(new_n61));
  xor_1  g39(.A(new_n61), .B(new_n45), .Y(po1));
  xor_1  g40(.A(new_n58), .B(new_n55), .Y(po2));
  not_11 g41(.A(pi01), .Y(new_n64));
  and_5  g42(.A(pi11), .B(new_n64), .Y(new_n65));
  and_5  g43(.A(pi10), .B(pi01), .Y(new_n66));
  or_3   g44(.A(new_n66), .B(pi06), .Y(new_n67));
  or_3   g45(.A(new_n67), .B(new_n65), .Y(new_n68));
  or_3   g46(.A(pi12), .B(new_n64), .Y(new_n69));
  or_3   g47(.A(pi13), .B(pi01), .Y(new_n70));
  and_5  g48(.A(new_n70), .B(pi06), .Y(new_n71));
  nand_7 g49(.A(new_n71), .B(new_n69), .Y(new_n72));
  and_5  g50(.A(new_n50), .B(new_n40), .Y(new_n73));
  nand_7 g51(.A(new_n54), .B(new_n29), .Y(new_n74));
  nand_7 g52(.A(new_n74), .B(new_n73), .Y(new_n75));
  nand_7 g53(.A(new_n75), .B(new_n44), .Y(new_n76));
  nand_7 g54(.A(new_n76), .B(new_n72), .Y(new_n77));
  and_5  g55(.A(new_n77), .B(new_n68), .Y(po3));
  and_5  g56(.A(new_n72), .B(new_n68), .Y(new_n79));
  and_5  g57(.A(new_n61), .B(new_n45), .Y(new_n80));
  nand_7 g58(.A(new_n40), .B(new_n23), .Y(new_n81));
  or_3   g59(.A(new_n81), .B(new_n80), .Y(new_n82));
  xor_1  g60(.A(new_n82), .B(new_n79), .Y(po5));
  and_5  g61(.A(po2), .B(po0), .Y(new_n84));
  and_5  g62(.A(new_n84), .B(po1), .Y(new_n85));
  and_5  g63(.A(new_n85), .B(po5), .Y(po4));
  and_5  g64(.A(new_n72), .B(new_n33), .Y(new_n87));
  and_5  g65(.A(new_n87), .B(new_n73), .Y(new_n88));
  nand_7 g66(.A(new_n88), .B(pi07), .Y(new_n89));
  nand_7 g67(.A(new_n89), .B(po3), .Y(po6));
  nand_7 g68(.A(new_n87), .B(new_n73), .Y(po7));
endmodule


