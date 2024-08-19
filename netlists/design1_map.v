// Benchmark "top_809960632_810038711_1598227639_893650103" written by ABC on Sun Aug 18 18:48:56 2024

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
    new_n55, new_n56, new_n57, new_n58, new_n59, new_n60, new_n61, new_n62,
    new_n63, new_n64, new_n67, new_n68, new_n69, new_n70, new_n71, new_n72,
    new_n73, new_n74, new_n75, new_n76, new_n77, new_n78, new_n79, new_n81,
    new_n82, new_n83, new_n84, new_n85, new_n86, new_n87, new_n88, new_n91,
    new_n93;
  nand_5 g00(.A(pi07), .B(pi07), .Y(new_n23));
  nor_5      g01(.A(new_n23), .B(pi02), .Y(new_n24));
  nand_5     g02(.A(pi10), .B(pi09), .Y(new_n25));
  nand_5 g03(.A(pi11), .B(pi11), .Y(new_n26));
  nor_5      g04(.A(new_n26), .B(pi09), .Y(new_n27));
  nor_5      g05(.A(new_n27), .B(pi04), .Y(new_n28));
  and_6      g06(.A(new_n28), .B(new_n25), .Y(new_n29));
  nor_5      g07(.A(pi13), .B(pi09), .Y(new_n30));
  nand_5 g08(.A(pi12), .B(pi12), .Y(new_n31));
  nand_5     g09(.A(new_n31), .B(pi09), .Y(new_n32));
  nand_5     g10(.A(new_n32), .B(pi04), .Y(new_n33));
  nor_5      g11(.A(new_n33), .B(new_n30), .Y(new_n34));
  nor_5      g12(.A(new_n34), .B(new_n29), .Y(new_n35));
  xor_4      g13(.A(new_n35), .B(new_n24), .Y(new_n36));
  nand_5 g14(.A(new_n36), .B(new_n36), .Y(po0));
  nor_5      g15(.A(pi13), .B(pi08), .Y(new_n38));
  nand_5     g16(.A(new_n31), .B(pi08), .Y(new_n39));
  nand_5     g17(.A(new_n39), .B(pi05), .Y(new_n40));
  nor_5      g18(.A(new_n40), .B(new_n38), .Y(new_n41));
  nand_5 g19(.A(new_n41), .B(new_n41), .Y(new_n42));
  nand_5     g20(.A(pi10), .B(pi08), .Y(new_n43));
  nor_5      g21(.A(new_n26), .B(pi08), .Y(new_n44));
  nor_5      g22(.A(new_n44), .B(pi05), .Y(new_n45));
  nand_5     g23(.A(new_n45), .B(new_n43), .Y(new_n46));
  nand_5     g24(.A(new_n46), .B(new_n42), .Y(new_n47));
  nand_5 g25(.A(new_n47), .B(new_n47), .Y(new_n48));
  nor_5      g26(.A(pi13), .B(pi00), .Y(new_n49));
  nand_5     g27(.A(new_n31), .B(pi00), .Y(new_n50));
  nand_5     g28(.A(new_n50), .B(pi03), .Y(new_n51));
  nor_5      g29(.A(new_n51), .B(new_n49), .Y(new_n52));
  nand_5     g30(.A(pi10), .B(pi00), .Y(new_n53));
  nor_5      g31(.A(new_n26), .B(pi00), .Y(new_n54));
  nor_5      g32(.A(new_n54), .B(pi03), .Y(new_n55));
  and_6      g33(.A(new_n55), .B(new_n53), .Y(new_n56));
  nor_5      g34(.A(new_n56), .B(new_n52), .Y(new_n57));
  nand_5 g35(.A(new_n24), .B(new_n24), .Y(new_n58));
  nand_5     g36(.A(new_n35), .B(new_n58), .Y(new_n59));
  nor_5      g37(.A(new_n34), .B(pi02), .Y(new_n60));
  nand_5     g38(.A(new_n60), .B(new_n59), .Y(new_n61));
  nand_5     g39(.A(new_n61), .B(new_n57), .Y(new_n62));
  nor_5      g40(.A(new_n52), .B(pi02), .Y(new_n63));
  nand_5     g41(.A(new_n63), .B(new_n62), .Y(new_n64));
  xor_4      g42(.A(new_n64), .B(new_n48), .Y(po1));
  xor_4      g43(.A(new_n61), .B(new_n57), .Y(po2));
  nand_5     g44(.A(pi10), .B(pi01), .Y(new_n67));
  nor_5      g45(.A(new_n26), .B(pi01), .Y(new_n68));
  nor_5      g46(.A(new_n68), .B(pi06), .Y(new_n69));
  nand_5     g47(.A(new_n69), .B(new_n67), .Y(new_n70));
  nor_5      g48(.A(pi13), .B(pi01), .Y(new_n71));
  nand_5     g49(.A(new_n31), .B(pi01), .Y(new_n72));
  nand_5     g50(.A(new_n72), .B(pi06), .Y(new_n73));
  nor_5      g51(.A(new_n73), .B(new_n71), .Y(new_n74));
  nor_5      g52(.A(new_n52), .B(new_n41), .Y(new_n75));
  or_6       g53(.A(new_n56), .B(new_n29), .Y(new_n76));
  nand_5     g54(.A(new_n76), .B(new_n75), .Y(new_n77));
  and_6      g55(.A(new_n77), .B(new_n46), .Y(new_n78));
  or_6       g56(.A(new_n78), .B(new_n74), .Y(new_n79));
  and_6      g57(.A(new_n79), .B(new_n70), .Y(po3));
  nand_5 g58(.A(new_n74), .B(new_n74), .Y(new_n81));
  nand_5     g59(.A(new_n81), .B(new_n70), .Y(new_n82));
  nand_5     g60(.A(new_n64), .B(new_n48), .Y(new_n83));
  nor_5      g61(.A(new_n41), .B(pi02), .Y(new_n84));
  nand_5     g62(.A(new_n84), .B(new_n83), .Y(new_n85));
  xor_4      g63(.A(new_n85), .B(new_n82), .Y(new_n86));
  and_6      g64(.A(po2), .B(po0), .Y(new_n87));
  nand_5     g65(.A(new_n87), .B(po1), .Y(new_n88));
  nor_5      g66(.A(new_n88), .B(new_n86), .Y(po4));
  nand_5 g67(.A(new_n86), .B(new_n86), .Y(po5));
  nor_5      g68(.A(new_n74), .B(new_n34), .Y(new_n91));
  nand_5     g69(.A(new_n91), .B(new_n75), .Y(po7));
  or_6       g70(.A(po7), .B(new_n23), .Y(new_n93));
  nand_5     g71(.A(new_n93), .B(po3), .Y(po6));
endmodule


