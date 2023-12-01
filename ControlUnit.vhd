LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ControlUnit IS
    PORT (
        Op_Code : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
        IMM_Jump : OUT STD_LOGIC; -- Indicates whether an immediate jump is to be performed.
        No_Operation : OUT STD_LOGIC; -- Signifies a no-operation condition.
        IMM_Effective_Address : OUT STD_LOGIC; -- Relates to the use of an immediate value for an effective address.
        ALU_Source_Select : OUT STD_LOGIC; -- Denotes the source selection for the Arithmetic Logic Unit (ALU).
        Forwarding_Source : OUT STD_LOGIC; -- Represents the source for forwarding data.
        ALU_Op_Code : OUT STD_LOGIC_VECTOR(4 DOWNTO 0); -- Specifies the operation code for the ALU.
        Implicit_Sources : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- Indicates the use of implicit sources.
        Forwarding_Swap : OUT STD_LOGIC; -- Suggests swapping of forwarding sources.
        Call_Stack_Pointer : OUT STD_LOGIC; -- Signifies a call operation on the stack pointer.
        Free_Operation : OUT STD_LOGIC; -- Represents a free operation.
        Protection_Signal : OUT STD_LOGIC; -- Indicates a protection condition.
        Memory_Read : OUT STD_LOGIC; -- Denotes a memory read operation.
        Memory_Write : OUT STD_LOGIC; -- Denotes a memory write operation.
        Write_Back : OUT STD_LOGIC; -- Signifies a write-back operation.
        Write_Back_2 : OUT STD_LOGIC; -- A secondary write-back operation.
        Write_Back_Source : OUT STD_LOGIC_VECTOR(1 DOWNTO 0); -- Specifies the source for write-back.
        Port_Read : OUT STD_LOGIC; -- Signifies a port read operation.
        Port_Write : OUT STD_LOGIC; -- Denotes a port write operation.
        Stack_Pointer_Select : OUT STD_LOGIC; -- Indicates the selection of the stack pointer.
        Stack_Pointer_Update : OUT STD_LOGIC -- Denotes an update operation on the stack pointer.
    );
END ENTITY ControlUnit;

ARCHITECTURE ControlUnitArch OF ControlUnit IS
BEGIN
    PROCESS (Op_Code)
    BEGIN
        CASE Op_Code IS
            WHEN "00000" => -- NOP
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Op_Code <= "00000";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00001" => -- RET
                IMM_Jump <= '1';
                No_Operation <= '1';
                ALU_Op_Code <= "00000";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00010" => -- RTI
                IMM_Jump <= '1';
                No_Operation <= '1';
                ALU_Op_Code <= "00000";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00011" => -- NOT
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "00001";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00100" => -- NEG
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "00010";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00101" => -- INC
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "00011";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00110" => -- DEC
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "00100";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "00111" => -- OUT
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '1';
                Stack_Pointer_Select <= '0';

            WHEN "01000" => -- IN
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "10";
                Port_Read <= '1';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "01001" => -- PUSH
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01110";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '1';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '1';
                Stack_Pointer_Update <= '0';

            WHEN "01010" => -- POP
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '1';
                Stack_Pointer_Update <= '1';

            WHEN "01011" => -- Protect
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01110";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '1';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "01100" => -- FREE
                IMM_Jump <= '0';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01110";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '1';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "01101" => -- JZ
                IMM_Jump <= '1';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "01110" => -- JMP
                IMM_Jump <= '1';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "01111" => -- CALL
                IMM_Jump <= '1';
                No_Operation <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01110";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '1';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10000" => -- ADD
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '1';
                ALU_Op_Code <= "00101";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10001" => -- SUB
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '1';
                ALU_Op_Code <= "00110";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10010" => -- AND
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '1';
                ALU_Op_Code <= "00111";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10011" => -- OR
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '1';
                ALU_Op_Code <= "01000";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10100" => -- XOR
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '1';
                ALU_Op_Code <= "01001";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10101" => -- SWAP
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01111";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '1';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '1';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10110" => -- CMP
                IMM_Jump <= '0';
                No_Operation <= '0';
                ALU_Source_Select <= '1';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01010";
                Implicit_Sources <= "00";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "10111" => -- ADDI
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '0';
                ALU_Source_Select <= '0';
                ALU_Op_Code <= "00101";
                Implicit_Sources <= "01";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "11000" => -- BITSET
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '0';
                ALU_Source_Select <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01011";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "11001" => -- RCL
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '0';
                ALU_Source_Select <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01100";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "11010" => -- RCR
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '0';
                ALU_Source_Select <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01101";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "11011" => -- LDM
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '0';
                ALU_Source_Select <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01111";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "01";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN "11100" => -- LDD
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '1';
                ALU_Source_Select <= '0';
                ALU_Op_Code <= "01111";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '1';
                Memory_Write <= '0';
                Write_Back <= '1';
                Write_Back_2 <= '0';
                Write_Back_Source <= "00";
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

            WHEN OTHERS => --WHEN "11101" => -- STD
                IMM_Jump <= '1';
                No_Operation <= '0';
                IMM_Effective_Address <= '1';
                ALU_Source_Select <= '0';
                Forwarding_Source <= '0';
                ALU_Op_Code <= "01111";
                Implicit_Sources <= "10";
                Forwarding_Swap <= '0';
                Call_Stack_Pointer <= '0';
                Free_Operation <= '0';
                Protection_Signal <= '0';
                Memory_Read <= '0';
                Memory_Write <= '1';
                Write_Back <= '0';
                Write_Back_2 <= '0';
                Port_Read <= '0';
                Port_Write <= '0';
                Stack_Pointer_Select <= '0';

        END CASE;
    END PROCESS;

END ARCHITECTURE ControlUnitArch;