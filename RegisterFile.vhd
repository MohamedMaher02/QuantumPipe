LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY RegisterFile IS
    PORT (
        Clk : IN STD_LOGIC;
        Rsrc1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Rsrc2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Rout1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Rout2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        Rin1 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        Rin2 : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        PCin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        PCout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        SPin : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
        SPout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
        CCRin : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        CCRout : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        RWriteSignal1 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        RWriteSignal2 : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        PCWriteSignal : IN STD_LOGIC; -- '0' Read / '1' Write
        SPWriteSignal : IN STD_LOGIC; -- '0' Read / '1' Write
        CCRWriteSignal : IN STD_LOGIC_VECTOR(2 DOWNTO 0) -- '0' Read / '1' Write
    );
END ENTITY RegisterFile;

ARCHITECTURE RegisterFileArch OF RegisterFile IS
    SIGNAL R0 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R1 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R2 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R3 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R4 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R5 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R6 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL R7 : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL PC : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL SP : STD_LOGIC_VECTOR(31 DOWNTO 0) := (OTHERS => '0');
    SIGNAL CCR : STD_LOGIC_VECTOR(2 DOWNTO 0) := (OTHERS => '0');
BEGIN
    PROCESS (Clk)
    BEGIN
        IF rising_edge(Clk) THEN
            CASE Rsrc1 IS
                WHEN "000" =>
                    Rout1 <= R0;
                WHEN "001" =>
                    Rout1 <= R1;
                WHEN "010" =>
                    Rout1 <= R2;
                WHEN "011" =>
                    Rout1 <= R3;
                WHEN "100" =>
                    Rout1 <= R4;
                WHEN "101" =>
                    Rout1 <= R5;
                WHEN "110" =>
                    Rout1 <= R6;
                WHEN OTHERS =>
                    Rout1 <= R7;
            END CASE;

            CASE Rsrc2 IS
                WHEN "000" =>
                    Rout2 <= R0;
                WHEN "001" =>
                    Rout2 <= R1;
                WHEN "010" =>
                    Rout2 <= R2;
                WHEN "011" =>
                    Rout2 <= R3;
                WHEN "100" =>
                    Rout2 <= R4;
                WHEN "101" =>
                    Rout2 <= R5;
                WHEN "110" =>
                    Rout2 <= R6;
                WHEN OTHERS =>
                    Rout2 <= R7;
            END CASE;

            IF (PCWriteSignal = '0') THEN
                PCout <= PC;
            END IF;

            IF (SPWriteSignal = '0') THEN
                SPout <= SP;
            END IF;

            IF (CCRWriteSignal = "000") THEN
                CCRout(0) <= CCR(0);
                CCRout(1) <= CCR(1);
                CCRout(2) <= CCR(2);
            END IF;
        END IF;

        IF falling_edge(Clk) THEN
            CASE RWriteSignal1 IS
                WHEN "000" =>
                    R0 <= Rin1;
                WHEN "001" =>
                    R1 <= Rin1;
                WHEN "010" =>
                    R2 <= Rin1;
                WHEN "011" =>
                    R3 <= Rin1;
                WHEN "100" =>
                    R4 <= Rin1;
                WHEN "101" =>
                    R5 <= Rin1;
                WHEN "110" =>
                    R6 <= Rin1;
                WHEN OTHERS =>
                    R7 <= Rin1;
            END CASE;

            CASE RWriteSignal2 IS
                WHEN "000" =>
                    R0 <= Rin2;
                WHEN "001" =>
                    R1 <= Rin2;
                WHEN "010" =>
                    R2 <= Rin2;
                WHEN "011" =>
                    R3 <= Rin2;
                WHEN "100" =>
                    R4 <= Rin2;
                WHEN "101" =>
                    R5 <= Rin2;
                WHEN "110" =>
                    R6 <= Rin2;
                WHEN OTHERS =>
                    R7 <= Rin2;
            END CASE;

            IF (PCWriteSignal = '1') THEN
                PC <= PCin;
            END IF;

            IF (SPWriteSignal = '1') THEN
                SP <= SPin;
            END IF;

            IF (CCRWriteSignal(0) = '1') THEN
                CCR(0) <= CCRin(0);
            END IF;

            IF (CCRWriteSignal(1) = '1') THEN
                CCR(1) <= CCRin(1);
            END IF;

            IF (CCRWriteSignal(2) = '1') THEN
                CCR(2) <= CCRin(2);
            END IF;
        END IF;
    END PROCESS;
END RegisterFileArch;