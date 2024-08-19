// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Sun Aug 18 13:48:57 2024

module top_809960632_810038711_1598227639_893650103 ( 
    pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09, pi10, pi11,
    pi12, pi13,
    po0, po1, po2, po3, po4, po5, po6, po7  );
  input  pi00, pi01, pi02, pi03, pi04, pi05, pi06, pi07, pi08, pi09,
    pi10, pi11, pi12, pi13;
  output po0, po1, po2, po3, po4, po5, po6, po7;
  wire new_n23, new_n24, new_n25, new_n26, new_n27, new_n28, new_n29,
    new_n30, new_n31, new_n32, new_n33, new_n34, new_n35, new_n36, new_n38,
    new_n39, new_n40, new_n41, new_n42, new_n43, new_n44, new_n45, new_n46,
    new_n47, new_n48, new_n49, new_n50, new_n51, new_n52, new_n53, new_n54,
    new_n55, new_n56, new_n57, new_n58, new_n59, new_n60, new_n61, new_n64,
    new_n65, new_n66, new_n67, new_n68, new_n69, new_n70, new_n71, new_n72,
    new_n73, new_n74, new_n75, new_n76, new_n78, new_n79, new_n80, new_n81,
    new_n83, new_n84, new_n86, new_n88;
  not_11     g00(.A(pi07), .Y(new_n23));
  nor_5      g01(.A(new_n23), .B(pi02), .Y(new_n24));
  not_11     g02(.A(new_n24), .Y(new_n25));
  nand_5     g03(.A(pi10), .B(pi09), .Y(new_n26));
  not_11     g04(.A(pi11), .Y(new_n27));
  nor_5      g05(.A(new_n27), .B(pi09), .Y(new_n28));
  nor_5      g06(.A(new_n28), .B(pi04), .Y(new_n29));
  and_6      g07(.A(new_n29), .B(new_n26), .Y(new_n30));
  nor_5      g08(.A(pi13), .B(pi09), .Y(new_n31));
  not_11     g09(.A(pi12), .Y(new_n32));
  nand_5     g10(.A(new_n32), .B(pi09), .Y(new_n33));
  nand_5     g11(.A(new_n33), .B(pi04), .Y(new_n34));
  nor_5      g12(.A(new_n34), .B(new_n31), .Y(new_n35));
  nor_5      g13(.A(new_n35), .B(new_n30), .Y(new_n36));
  xor_4      g14(.A(new_n36), .B(new_n25), .Y(po0));
  nor_5      g15(.A(pi13), .B(pi08), .Y(new_n38));
  nand_5     g16(.A(new_n32), .B(pi08), .Y(new_n39));
  nand_5     g17(.A(new_n39), .B(pi05), .Y(new_n40));
  nor_5      g18(.A(new_n40), .B(new_n38), .Y(new_n41));
  nand_5     g19(.A(pi10), .B(pi08), .Y(new_n42));
  nor_5      g20(.A(new_n27), .B(pi08), .Y(new_n43));
  nor_5      g21(.A(new_n43), .B(pi05), .Y(new_n44));
  and_6      g22(.A(new_n44), .B(new_n42), .Y(new_n45));
  nor_5      g23(.A(new_n45), .B(new_n41), .Y(new_n46));
  nor_5      g24(.A(pi13), .B(pi00), .Y(new_n47));
  nand_5     g25(.A(new_n32), .B(pi00), .Y(new_n48));
  nand_5     g26(.A(new_n48), .B(pi03), .Y(new_n49));
  nor_5      g27(.A(new_n49), .B(new_n47), .Y(new_n50));
  nand_5     g28(.A(pi10), .B(pi00), .Y(new_n51));
  nor_5      g29(.A(new_n27), .B(pi00), .Y(new_n52));
  nor_5      g30(.A(new_n52), .B(pi03), .Y(new_n53));
  and_6      g31(.A(new_n53), .B(new_n51), .Y(new_n54));
  nor_5      g32(.A(new_n54), .B(new_n50), .Y(new_n55));
  nand_5     g33(.A(new_n36), .B(new_n25), .Y(new_n56));
  nor_5      g34(.A(new_n35), .B(pi02), .Y(new_n57));
  nand_5     g35(.A(new_n57), .B(new_n56), .Y(new_n58));
  nand_5     g36(.A(new_n58), .B(new_n55), .Y(new_n59));
  nor_5      g37(.A(new_n50), .B(pi02), .Y(new_n60));
  nand_5     g38(.A(new_n60), .B(new_n59), .Y(new_n61));
  xor_4      g39(.A(new_n61), .B(new_n46), .Y(po1));
  xor_4      g40(.A(new_n58), .B(new_n55), .Y(po2));
  nand_5     g41(.A(pi10), .B(pi01), .Y(new_n64));
  nor_5      g42(.A(new_n27), .B(pi01), .Y(new_n65));
  nor_5      g43(.A(new_n65), .B(pi06), .Y(new_n66));
  and_6      g44(.A(new_n66), .B(new_n64), .Y(new_n67));
  nor_5      g45(.A(pi13), .B(pi01), .Y(new_n68));
  nand_5     g46(.A(new_n32), .B(pi01), .Y(new_n69));
  nand_5     g47(.A(new_n69), .B(pi06), .Y(new_n70));
  nor_5      g48(.A(new_n70), .B(new_n68), .Y(new_n71));
  nor_5      g49(.A(new_n50), .B(new_n41), .Y(new_n72));
  or_6       g50(.A(new_n54), .B(new_n30), .Y(new_n73));
  and_6      g51(.A(new_n73), .B(new_n72), .Y(new_n74));
  nor_5      g52(.A(new_n74), .B(new_n45), .Y(new_n75));
  nor_5      g53(.A(new_n75), .B(new_n71), .Y(new_n76));
  nor_5      g54(.A(new_n76), .B(new_n67), .Y(po3));
  nor_5      g55(.A(new_n71), .B(new_n67), .Y(new_n78));
  nand_5     g56(.A(new_n61), .B(new_n46), .Y(new_n79));
  nor_5      g57(.A(new_n41), .B(pi02), .Y(new_n80));
  nand_5     g58(.A(new_n80), .B(new_n79), .Y(new_n81));
  xor_4      g59(.A(new_n81), .B(new_n78), .Y(po5));
  and_6      g60(.A(po2), .B(po0), .Y(new_n83));
  and_6      g61(.A(new_n83), .B(po1), .Y(new_n84));
  and_6      g62(.A(new_n84), .B(po5), .Y(po4));
  nor_5      g63(.A(new_n71), .B(new_n35), .Y(new_n86));
  nand_5     g64(.A(new_n86), .B(new_n72), .Y(po7));
  or_6       g65(.A(po7), .B(new_n23), .Y(new_n88));
  nand_5     g66(.A(new_n88), .B(po3), .Y(po6));
endmodule


