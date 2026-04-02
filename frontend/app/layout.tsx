import { FC, PropsWithChildren } from "react";
import "./ui/globals.css";

const Layout: FC<PropsWithChildren> = ({ children }) => {
    return (
        <html lang="es">
            <body className={`bg-slate-900 text-slate-200`}>
                {children}
            </body>
        </html>
    );
};

export default Layout;