-- Jainer Pinta
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity c_alarma is
    Port ( clk, fx, cont4, boton : in  STD_LOGIC;
           reset, inc, activa, alarma : out  STD_LOGIC);
end c_alarma;

architecture arq_alarma of c_alarma is
	type estados1 is (A,B,C,D,E,F,G,H,I,J,K,L);
	signal edo_pres, edo_fut : estados1;
		begin
				p_estados1: process (edo_pres, clk, fx, cont4, boton)
begin
					case edo_pres is
						when A => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							edo_fut <= B;
						when B => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if boton = '1' then
								edo_fut <= C;
							else
								edo_fut <= B;
							end if;
						when C => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if fx = '1' then
								edo_fut <= D;
							else
								edo_fut <= H;
							end if;
						when D => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if boton = '1' then
								edo_fut <= D;
							else
								edo_fut <= E;
							end if;
						when E => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if cont4 = '1' then
								edo_fut <= G;
							else
								edo_fut <= F;
							end if;
						when F => reset <= '0'; activa <= '0'; alarma <= '0'; inc <= '1';
							edo_fut <= B;
						when G => reset <= '0'; activa <= '1'; inc <= '0'; alarma <='0';
							edo_fut <= A;
						when H => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if boton = '1' then
								edo_fut <= H;
							else
								edo_fut <= I;
							end if;
						when I => reset <= '0'; inc  <= '0'; activa <= '0'; alarma <= '0';
							if cont4 = '1' then
								edo_fut <= L;
							else
								edo_fut <= J;
							end if;
						when J => reset <= '0'; inc <= '1'; activa <= '0'; alarma <= '0';
							edo_fut <= K;
						when K => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '0';
							if boton = '1' then
								edo_fut <= H;
							else
								edo_fut <= K;
							end if;
						when L => reset <= '0'; inc <= '0'; activa <= '0'; alarma <= '1';
							edo_fut <= A;
					end case;
				end process;
		reloj: process (clk) begin
				if (clk'event and clk = '1') then
					edo_pres <= edo_fut;
				end if;
		end process;
end arq_alarma;

